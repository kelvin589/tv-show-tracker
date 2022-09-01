import 'package:track/models/show_detail.dart';

abstract class FavouritesRepository {
  Future<void> markFavourite(ShowDetail show);
  Future<bool> isFavourite(int showId);
  Stream<List<ShowDetail>> getFavourites();
  Future<void> updateFavourite(ShowDetail show);
  Stream<bool> isFavouriteStream(int showId);
}