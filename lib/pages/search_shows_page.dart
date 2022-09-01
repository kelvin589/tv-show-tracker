import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/widgets/base_shows_page.dart';
import 'package:track/providers/page_results_notifier.dart';
import 'package:track/providers/state.dart';
import 'package:track/states/page_state.dart';

final _searchQueryProvider = StateProvider<String>((ref) {
  return '';
});

final _searchShowsProvider = StateNotifierProvider.autoDispose<PageResultsNotifier, PageState>((ref) {
  final showsRepository = ref.watch(showsRepositoryProvider);
  final searchQuery = ref.watch(_searchQueryProvider);
  return PageResultsNotifier(resultsOriginBuilder: (page) => showsRepository.search(searchQuery, page: page));
});

class SearchShowsPage extends ConsumerWidget {
  const SearchShowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(_searchQueryProvider);
    final filteredSearch = ref.watch(_searchShowsProvider);

    void loadNext() {
      ref.read(_searchShowsProvider.notifier).next();
    }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
              ),
              onChanged: (value) => ref
                  .read(_searchQueryProvider.notifier)
                  .state = value.toLowerCase().trim(),
            ),
          ),
          searchQuery.isEmpty
              ? const Expanded(
                  child: Center(child: Text('Enter text to search for shows')))
              : Expanded(
                  child: BaseShowspage(
                    pageState: filteredSearch,
                    onMaxExtentReached: loadNext,
                    emptyResultsMessage: 'No shows matching search',
                  ),
                ),
        ],
      ),
    );
  }
}
