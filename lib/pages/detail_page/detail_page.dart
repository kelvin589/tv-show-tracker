import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models/show_detail.dart';
import 'package:track/pages/detail_page/information_page.dart';
import 'package:track/pages/detail_page/progress_page.dart';
import 'package:track/providers/state.dart';

final _isFavouriteProvider =
    FutureProvider.autoDispose.family<bool, int>((ref, showId) async {
  return ref.watch(favouritesRepositoryProvider).isFavourite(showId);
});

class DetailPage extends ConsumerWidget {
  const DetailPage({Key? key, required this.show}) : super(key: key);

  final ShowDetail show;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = [InformationPage(show: show), ProgressPage(show: show)];
    final isFavourite = ref.watch(_isFavouriteProvider(show.id));

    return isFavourite.whenOrNull(
          data: (data) => DefaultTabController(
            length: tabs.length,
            initialIndex: data ? 1 : 0,
            child: Scaffold(
              appBar: AppBar(
                title: Text(show.name),
                bottom: const TabBar(
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.info),
                      iconMargin: EdgeInsets.zero,
                      text: 'Information',
                      height: 50,
                    ),
                    Tab(
                      icon: Icon(Icons.list),
                      iconMargin: EdgeInsets.zero,
                      text: 'Episodes',
                      height: 50,
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(children: tabs),
              ),
            ),
          ),
        ) ??
        Container();
  }
}
