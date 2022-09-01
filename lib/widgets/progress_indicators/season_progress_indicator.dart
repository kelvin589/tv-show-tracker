import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models_stored/id_episode.dart';
import 'package:track/providers/state.dart';
import 'package:track/widgets/progress_indicators/circular_watched_indicator.dart';

final _seasonWatchedProgressProvider =
    StreamProvider.autoDispose.family<double, IDEpisode>((ref, show) {
  return ref
      .read(watchedRepositoryProvider)
      .seasonWatchedPercentageStream(show.showId, show.seasonNumber);
});

class SeasonProgressIndicator extends ConsumerWidget {
  const SeasonProgressIndicator({
    Key? key,
    required this.showId,
    required this.season,
  }) : super(key: key);

  final int showId;
  final int season;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasonWatchedProgress = ref.watch(_seasonWatchedProgressProvider(
      IDEpisode(showId: showId, seasonNumber: season),
    ));

    return CircularWatchedIndicator(
      value: seasonWatchedProgress.whenOrNull(data: (data) => data) ?? 0.0,
    );
  }
}
