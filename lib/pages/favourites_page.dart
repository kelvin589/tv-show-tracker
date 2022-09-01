import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models/show_detail.dart';
import 'package:track/providers/favourites_notifier.dart';
import 'package:track/providers/state.dart';
import 'package:track/widgets/shows_list.dart';

final _favouritesProvider = StateNotifierProvider<FavouritesNotifier, Stream<List<ShowDetail>>>((ref) {
  final favouritesRepository = ref.watch(favouritesRepositoryProvider);
  return FavouritesNotifier(favouritesRepository);
});

final _favourites = StreamProvider<List<ShowDetail>>((ref) {
  return ref.watch(_favouritesProvider);
});

class FavouritesPage extends ConsumerWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(_favourites);

    return favourites.when(
      data: (shows) {
        return shows.isEmpty
            ? const Center(child: Text('Add some shows to your favourites'))
            : ShowsList(
                shows: shows.map((showDetail) => showDetail.toShow()).toList(),
                horizontal: false,
              );
      },
      error: (error, _) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
