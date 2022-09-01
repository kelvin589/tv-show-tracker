import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/pages/discover_page/popular_shows_page.dart';
import 'package:track/pages/discover_page/top_shows_page.dart';

class DiscoverPage extends ConsumerWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const tabs = [PopularShowsPage(), TopShowsPage()];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.local_fire_department),
                iconMargin: EdgeInsets.zero,
                text: 'Popular',
              ),
              Tab(
                icon: Icon(Icons.trending_up),
                iconMargin: EdgeInsets.zero,
                text: 'Top',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: tabs,
        ),
      ),
    );
  }
}
