import 'package:sembast/sembast.dart';
import 'package:track/models/show_detail.dart';
import 'package:track/repositories/favourites_repository.dart';

class SembastFavouritesRepository implements FavouritesRepository {
  static const String favouritesStore = 'favourites_store';

  final Database database;
  final StoreRef<int, Map<String, dynamic>> _store;

  SembastFavouritesRepository(this.database)
      : _store = intMapStoreFactory.store(favouritesStore);

  @override
  Future<void> markFavourite(ShowDetail show) async {
    if (await isFavourite(show.id)) {
      _removeFavourite(show.id);
    } else {
      _addFavourite(show);
    }
  }

  @override
  Future<bool> isFavourite(int showId) async {
    return (await _store.record(showId).get(database)) != null;
  }

  Future<int?> _addFavourite(ShowDetail show) async {
    return _store.record(show.id).add(database, show.toJson());
  }

  Future<int?> _removeFavourite(int showId) async {
    return _store.record(showId).delete(database);
  }

  @override
  Future<void> updateFavourite(ShowDetail show) async {
    _store.record(show.id).update(database, show.toJson());
  }

  @override
  Stream<List<ShowDetail>> getFavourites() {
    return _store
        .query()
        .onSnapshots(database)
        .map((snapshot) => snapshot.map((show) {
              return ShowDetail.fromJson(show.value);
            }).toList());
  }

  @override
  Stream<bool> isFavouriteStream(int showId) {
    return _store
        .record(showId)
        .onSnapshot(database)
        .map((snapshot) => snapshot != null);
  }
}
