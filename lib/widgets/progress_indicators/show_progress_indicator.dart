import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/providers/state.dart';
import 'package:track/widgets/progress_indicators/circular_watched_indicator.dart';
import 'package:track/widgets/progress_indicators/linear_watched_indicator.dart';

final _showWatchedProgressProvider =
    StreamProvider.autoDispose.family<double, int>((ref, showId) {
  return ref
      .read(watchedRepositoryProvider)
      .showWatchedPercentage(showId);
});

class ShowProgressIndicator extends ConsumerWidget {
  const ShowProgressIndicator({
    Key? key,
    required this.showId,
    this.linear = false,
  }) : super(key: key);

  final int showId;
  final bool linear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasonWatchedProgress = ref.watch(_showWatchedProgressProvider(showId));

    return linear
        ? LinearWatchedIndicator(
            value:
                seasonWatchedProgress.whenOrNull(data: (data) => data) ?? 0.0,
          )
        : CircularWatchedIndicator(
            value:
                seasonWatchedProgress.whenOrNull(data: (data) => data) ?? 0.0,
          );
  }
}
