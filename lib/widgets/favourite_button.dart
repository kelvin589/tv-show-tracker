import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/providers/state.dart';

final _isFavouriteProvider =
    StreamProvider.autoDispose.family<bool, int>((ref, showId) {
  return ref.watch(favouritesRepositoryProvider).isFavouriteStream(showId);
});

class FavouriteButton extends ConsumerWidget {
  const FavouriteButton({Key? key, required this.showId}) : super(key: key);

  final int showId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavourite = ref.watch(_isFavouriteProvider(showId));
    final showsRepository = ref.watch(showsRepositoryProvider);

    void onFavourited(int show) {
      showsRepository.getShow(show).then((showDetail) {
        return ref.read(favouritesRepositoryProvider).markFavourite(showDetail);
      });
    }

    return GestureDetector(
      onTap: () => onFavourited(showId),
      child: isFavourite.maybeWhen(data: (data) => data, orElse: () => false)
          ? const Icon(Icons.indeterminate_check_box)
          : const Icon(Icons.add_box),
    );
  }
}
