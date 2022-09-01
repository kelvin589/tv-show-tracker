import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/providers/page_results_notifier.dart';
import 'package:track/providers/state.dart';
import 'package:track/states/page_state.dart';
import 'package:track/widgets/base_shows_page.dart';

final _recommendationsProvider = StateNotifierProvider.autoDispose
    .family<PageResultsNotifier, PageState, int>((ref, showId) {
  final showsRepository = ref.watch(showsRepositoryProvider);
  return PageResultsNotifier(
      resultsOriginBuilder: (page) =>
          showsRepository.getRecommendations(showId, page: page));
});

class RecommendationsList extends ConsumerWidget {
  const RecommendationsList({Key? key, required this.showId, this.horizontal = false}) : super(key: key);

  final int showId;
  final bool horizontal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendations = ref.watch(_recommendationsProvider(showId));

    void onMaxExtentReached() {
      ref.read(_recommendationsProvider(showId).notifier).next();
    }

    return BaseShowspage(
      pageState: recommendations,
      onMaxExtentReached: onMaxExtentReached,
      emptyResultsMessage: 'No recommendations',
      horizontal: horizontal,
    );
  }
}
