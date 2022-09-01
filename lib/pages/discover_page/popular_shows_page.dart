import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/widgets/base_shows_page.dart';
import 'package:track/providers/page_results_notifier.dart';
import 'package:track/providers/state.dart';
import 'package:track/states/page_state.dart';

final _popularShowsProvider = StateNotifierProvider<PageResultsNotifier, PageState>((ref) {
  final showsRepository = ref.watch(showsRepositoryProvider);
  return PageResultsNotifier(resultsOriginBuilder: (page) => showsRepository.getPopular(page: page));
});

class PopularShowsPage extends ConsumerWidget {
  const PopularShowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularShows = ref.watch(_popularShowsProvider);

    void loadNext() {
      ref.read(_popularShowsProvider.notifier).next();
    }

    return BaseShowspage(
      pageState: popularShows,
      onMaxExtentReached: loadNext,
      emptyResultsMessage: 'No popular shows found',
    );
  }
}
