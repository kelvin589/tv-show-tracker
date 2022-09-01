import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models/show.dart';
import 'package:track/widgets/show_card.dart';

class ShowsList extends ConsumerStatefulWidget {
  const ShowsList(
      {Key? key,
      required this.shows,
      this.onMaxExtentReached,
      this.onNoMoreResults,
      required this.horizontal})
      : super(key: key);

  final List<Show> shows;
  final VoidCallback? onMaxExtentReached;
  final Future<bool> Function()? onNoMoreResults;
  final bool horizontal;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowsListState();
}

class _ShowsListState extends ConsumerState<ShowsList> {
  final scrollController = ScrollController();
  bool canCall = true;

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    final max = scrollController.position.maxScrollExtent;
    final threshold = max * 0.2;
    final offset = scrollController.offset;
    final endReached = max - offset < threshold;
    if (endReached) {
      widget.onMaxExtentReached?.call();
      if (canCall) {
        canCall = false;
        widget.onNoMoreResults?.call().then((value) => canCall = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      cacheExtent: 3000,
      scrollDirection: widget.horizontal ? Axis.horizontal : Axis.vertical,
      itemCount: widget.shows.length,
      controller: scrollController,
      gridDelegate: widget.horizontal
          ? const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3 / 2,
            )
          : const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 2 / 3,
            ),
      itemBuilder: (context, index) {
        return ShowCard(show: widget.shows[index]);
      },
    );
  }
}
