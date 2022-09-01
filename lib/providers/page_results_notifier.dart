import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models/failure.dart';
import 'package:track/models/results.dart';
import 'package:track/models/show.dart';
import 'package:track/states/page_state.dart';

class PageResultsNotifier extends StateNotifier<PageState> {
  PageResultsNotifier({required this.resultsOriginBuilder})
      : super(const PageState.data([], false)) {
    _init();
  }

  final Future<Results> Function(int page) resultsOriginBuilder;
  final List<Show> _shows = [];
  int _page = 1;

  void _init() {
    next();
  }

  bool _canLoadNext() {
    return state.maybeWhen(
      data: (_, endReached) => !endReached,
      loading: (_) => false,
      orElse: () => false,
    );
  }

  Future<void> next() async {
    if (!_canLoadNext()) return;

    state = PageState.loading(_shows);
    try {
      final result = await resultsOriginBuilder(_page);
      if (result.shows.isEmpty || _page > result.totalPages) {
        if (!mounted) return;
        state = PageState.data(_shows, true);
      } else {
        if (!mounted) return;
        state = PageState.data(_shows..addAll(result.shows), false);
        _page++;
      }
    } on Failure catch (failure) {
      if (!mounted) return;
      state = PageState.error(failure.toString());
    }
  }
}
