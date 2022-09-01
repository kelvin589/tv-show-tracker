import 'package:sembast/sembast.dart';
import 'package:track/models/season.dart';
import 'package:track/models_stored/id_episode.dart';
import 'package:track/models_stored/stored_episode.dart';
import 'package:track/models_stored/stored_season.dart';
import 'package:track/models_stored/stored_seasons.dart';
import 'package:track/repositories/watched_repository.dart';

class SembastWatchedRepository implements WatchedRepository {
  static const String episodeStore = 'episode_store';
  static const String seasonStore = 'season_store';
  static const String seasonsStore = 'seasons_store';

  final Database database;
  final StoreRef<int, Map<String, dynamic>> _seasonsStore;
  final StoreRef<String, Map<String, dynamic>> _seasonStore;
  final StoreRef<String, Map<String, dynamic>> _episodeStore;

  SembastWatchedRepository(this.database)
      : _seasonsStore = intMapStoreFactory.store(seasonsStore),
        _seasonStore = stringMapStoreFactory.store(seasonStore),
        _episodeStore = stringMapStoreFactory.store(episodeStore);
  
  @override
  Stream<IDEpisode?> nextEpisode(int showId) {
    return _seasonsStore
        .record(showId)
        .onSnapshot(database)
        .map((event) {
          if (event != null) {
            final seasons = StoredSeasons.fromJson(event.value);
            return seasons.nextEpisode;
          }
          return IDEpisode(showId: showId, seasonNumber: 1, episodeNumber: 1);
        });
  }
  
  @override
  Stream<double> showWatchedPercentage(int showId) {
    return _seasonsStore
        .record(showId)
        .onSnapshot(database)
        .asyncMap((event) async {
          if (event != null) {
            final obj = StoredSeasons.fromJson(event.value);
            double total = 0;
            for (var element in obj.seasons) {
              total += await seasonWatchedPercentage(element);
            }
            return total / obj.seasons.length;
          }
          return 0.0;
        });
  }

  @override
  Stream<double> seasonWatchedPercentageStream(int showId, int season) {
    return _seasonStore
        .record(_seasonId(showId, season))
        .onSnapshot(database)
        .map((event) {
      if (event != null) {
        final json = event.value;
        final obj = StoredSeason.fromJson(json);
        return obj.watched / obj.total;
      }
      return 0.0;
    });
  }

  @override
  Future<double> seasonWatchedPercentage(String seasonId) async {
    final json = await _seasonStore
        .record(seasonId)
        .get(database);
  
    if (json != null) {
      final obj = StoredSeason.fromJson(json);
      return obj.watched / obj.total;
    }
    return 0.0;
  }

  @override
  Stream<bool> isWatchedStream(int showId, int season, int episode) {
    return _episodeStore
        .record(_episodeId(showId, season, episode))
        .onSnapshot(database)
        .map((event) => event != null);
  }

  @override
  Future<bool> isWatched(int showId, int season, int episode) async {
    final json = await _episodeStore
        .record(_episodeId(showId, season, episode))
        .get(database);
    return json != null;
  }

  @override
  Future<void> markWatched(int showId, List<Season> seasons, int season,
      int episode, bool watched) async {
    await _updateShowInformation(showId, seasons);

    await database.transaction((transaction) async {
      await _markEpisodeWatched(transaction, showId, season, episode, watched);
      await _markSeasonWatched(transaction, showId, season, watched);
    });
    await database.transaction((transaction) async {
      await _setNextEpisode(transaction, showId, seasons);
    });
  }

  Future<void> _markEpisodeWatched(Transaction transaction, int showId, int season,
      int episode, bool watched) async {
    // mark episode as watched
    final episodeKey = _episodeId(showId, season, episode);
    final currentEpisode = await _episodeStore.record(episodeKey).get(transaction);
    if (currentEpisode != null) {
      await _episodeStore.record(episodeKey).delete(transaction);
    } else {
      await _episodeStore
          .record(episodeKey)
          .put(transaction, StoredEpisode(number: episode).toJson());
    }
  }

  Future<void> _setNextEpisode(Transaction transaction, int showId, List<Season> seasons) async {
    IDEpisode? next;
    
    outer:
    for (int season = 1; season <= seasons.length; season++) {
      final episodes = seasons[season - 1].episodes;
      for (int episode = 1; episode <= episodes.length; episode++) {
        if (await isWatched(showId, season, episode)) {
          continue;
        }
        next = IDEpisode(
          showId: showId, 
          seasonNumber: season, 
          episodeNumber: episode,
        );
        break outer;
      }
    }

    await _seasonsStore
        .record(showId)
        .put(transaction, {'nextEpisode': next?.toJson()}, merge: true);
  }

  Future<void> _markSeasonWatched(Transaction transaction, int showId, int season, bool watched) async {
    // increment if watched is true, otherwise decrement
    // mark if all episodes in a season have been watched
    final seasonKey = _seasonId(showId, season);
    final currentSeason = await _seasonStore.record(seasonKey).get(transaction);
    if (currentSeason != null) {
      final storedSeason = StoredSeason.fromJson(currentSeason);
      final updatedTotal =
          watched ? storedSeason.watched + 1 : storedSeason.watched - 1;
      final updatedSeason = storedSeason.copyWith(watched: updatedTotal);
      await _seasonStore
          .record(seasonKey)
          .put(transaction, updatedSeason.toJson());
      
      // update if full season is watched
      final currentSeasons = await _seasonsStore.record(showId).get(transaction);
      if (currentSeasons != null) {
        final storedSeasons = StoredSeasons.fromJson(currentSeasons);

        int updatedSeasonsTotal = storedSeasons.watched;
        if (watched && updatedTotal == storedSeason.total) {
          updatedSeasonsTotal++;
        } else if (!watched && updatedTotal == storedSeason.total - 1) {
          if (updatedSeasonsTotal > 0) updatedSeasonsTotal--;
        }

        final updatedSeasons =
            storedSeasons.copyWith(watched: updatedSeasonsTotal);
        await _seasonsStore
            .record(showId)
            .put(transaction, updatedSeasons.toJson());
      }
    }
  }

  String _seasonId(int showId, int seasonNumber) {
    return '${showId}S$seasonNumber';
  }

  String _episodeId(int showId, int seasonNumber, int episodeNumber) {
    return '${showId}S${seasonNumber}E$episodeNumber';
  }

  Future<void> _updateShowInformation(int showId, List<Season> seasons) async {
    await database.transaction((transaction) async {
      await _updateSeasonsInformation(transaction, showId, seasons);
      await _updateEpisodesInformation(transaction, showId, seasons);
    });
  }

  Future<void> _updateSeasonsInformation(Transaction transaction, int showId, List<Season> seasons) async {
    // seasons
    final storedSeasonsJson = await _seasonsStore.record(showId).get(transaction);
    StoredSeasons? storedSeasons;
    if (storedSeasonsJson != null) {
      storedSeasons = StoredSeasons.fromJson(storedSeasonsJson);
    }
    // only update if we havent already got it or seasons different length
    if (storedSeasons == null || storedSeasons.seasons.length != seasons.length) {
      await _seasonsStore.record(showId).put(
          transaction,
          StoredSeasons(
            total: seasons.length,
            watched: storedSeasons?.watched ?? 0,
            // lastWatchedAt: null,
            seasons:
                seasons.map((e) => _seasonId(showId, e.seasonNumber)).toList(),
            nextEpisode: storedSeasons?.nextEpisode,
          ).toJson(),
        );
    }
  }

  Future<void> _updateEpisodesInformation(Transaction transaction, int showId, List<Season> seasons) async {
    // season episodes
    for (var s in seasons) {
      final seasonKey = _seasonId(showId, s.seasonNumber);
      final storedSeasonJson = await _seasonStore.record(seasonKey).get(transaction);
      StoredSeason? storedSeason;
      if (storedSeasonJson != null) {
        storedSeason = StoredSeason.fromJson(storedSeasonJson);
      }
      if (storedSeason == null || storedSeason.episodes.length != s.episodes.length) {
        await _seasonStore.record(seasonKey).put(
              transaction,
              StoredSeason(
                number: s.seasonNumber,
                total: s.episodes.length,
                watched: storedSeason?.watched ?? 0,
                episodes: s.episodes
                    .map((e) =>
                        _episodeId(showId, e.seasonNumber, e.episodeNumber))
                    .toList(),
              ).toJson(),
            );
      }
    }
  }
}
