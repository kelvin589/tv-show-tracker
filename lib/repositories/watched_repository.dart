import 'package:track/models/season.dart';
import 'package:track/models_stored/id_episode.dart';

abstract class WatchedRepository {
  Future<void> markWatched( int showId, List<Season> seasons, int season, int episode, bool watched);
  Future<bool> isWatched(int showId, int season, int episode);
  Stream<bool> isWatchedStream(int showId, int season, int episode);
  Stream<double> seasonWatchedPercentageStream(int showId, int season);
  Future<double> seasonWatchedPercentage(String seasonId);
  Stream<double> showWatchedPercentage(int showId);
  Stream<IDEpisode?> nextEpisode(int showId);
}