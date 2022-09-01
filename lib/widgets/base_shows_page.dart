import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/states/page_state.dart';
import 'package:track/widgets/shows_list.dart';

class BaseShowspage extends ConsumerStatefulWidget {
  const BaseShowspage(
      {Key? key,
      required this.pageState,
      required this.onMaxExtentReached,
      required this.emptyResultsMessage,
      this.horizontal = false})
      : super(key: key);

  final PageState pageState;
  final VoidCallback onMaxExtentReached;
  final String emptyResultsMessage;
  final bool horizontal;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseShowspageState();
}

class _BaseShowspageState extends ConsumerState<BaseShowspage> {
  bool _showingAlert = false;

  @override
  Widget build(BuildContext context) {
    Future<bool> endReachedAlert() async {
      if (_showingAlert) return Future.value(true);

      await ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              content: const Text('End Reached!'),
              onVisible: () => _showingAlert = true,
            ),
          )
          .closed;

      _showingAlert = false;

      return Future.value(false);
    }

    return widget.pageState.when(
      data: (shows, endReached) => shows.isEmpty
          ? Center(child: Text(widget.emptyResultsMessage))
          : ShowsList(
              shows: shows,
              horizontal: widget.horizontal,
              onMaxExtentReached: widget.onMaxExtentReached,
              onNoMoreResults: endReached ? endReachedAlert : null,
            ),
      error: (error) => Center(child: Text(error)),
      loading: (shows) {
        return ShowsList(shows: shows, horizontal: widget.horizontal);
      },
    );
  }
}
