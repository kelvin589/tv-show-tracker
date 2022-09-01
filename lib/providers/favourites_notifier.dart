import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/models/show_detail.dart';
import 'package:track/repositories/favourites_repository.dart';

class FavouritesNotifier extends StateNotifier<Stream<List<ShowDetail>>> {
  FavouritesNotifier(this.favouritesRepository) : super(const Stream.empty()) {
    _load();
  }

  final FavouritesRepository favouritesRepository;

  void _load() {
    state = favouritesRepository.getFavourites();
  }

  Future<void> markFavourite(ShowDetail show) async {
    await favouritesRepository.markFavourite(show);
  }

  Future<bool> isFavourite(int showId) async {
    return await favouritesRepository.isFavourite(showId);
  }

  Stream<bool> isFavouriteStream(int showId) {
    return favouritesRepository.isFavouriteStream(showId);
  }
}
