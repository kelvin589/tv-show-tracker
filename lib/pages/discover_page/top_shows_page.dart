import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/widgets/base_shows_page.dart';
import 'package:track/providers/page_results_notifier.dart';
import 'package:track/providers/state.dart';
import 'package:track/states/page_state.dart';

final _topShowsProvider = StateNotifierProvider<PageResultsNotifier, PageState>((ref) {
  final showsRepository = ref.watch(showsRepositoryProvider);
  return PageResultsNotifier(resultsOriginBuilder: (page) => showsRepository.getTop(page: page));
});

class TopShowsPage extends ConsumerWidget {
  const TopShowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topShows = ref.watch(_topShowsProvider);

    void loadNext() {
      ref.read(_topShowsProvider.notifier).next();
    }

    return BaseShowspage(
      pageState: topShows,
      onMaxExtentReached: loadNext,
      emptyResultsMessage: 'No top shows found',
    );
  }
}
