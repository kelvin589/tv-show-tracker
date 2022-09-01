import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models/episode.dart';
import 'package:track/models/season.dart';
import 'package:track/models_stored/id_episode.dart';
import 'package:track/providers/state.dart';
import 'package:track/widgets/episode_tile.dart';

final _nextEpisodeProvider =
    StreamProvider.autoDispose.family<IDEpisode?, int>((ref, showId) {
  return ref.read(watchedRepositoryProvider).nextEpisode(showId);
});

final _episodeProvider =
    FutureProvider.autoDispose.family<Episode, IDEpisode>((ref, episode) async {
  return ref
      .watch(showsRepositoryProvider)
      .getEpisode(episode.showId, episode.seasonNumber, episode.episodeNumber);
});

class NextEpisodeTile extends ConsumerWidget {
  const NextEpisodeTile({
    Key? key,
    required this.showId,
    required this.seasons,
  }) : super(key: key);

  final int showId;
  final List<Season> seasons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextEpisode = ref.watch(_nextEpisodeProvider(showId));

    return nextEpisode.whenOrNull(data: ((nextEpisode) {
          if (nextEpisode != null) {
            final episode = ref.watch(_episodeProvider(nextEpisode));
            return episode.whenOrNull(
                  data: (episode) => EpisodeTile(
                    showId: showId,
                    episode: episode,
                    seasons: seasons,
                  ),
                ) ??
                const CircularProgressIndicator();
          }
          return const Text('No more episodes');
        })) ??
        const CircularProgressIndicator();
  }
}
