import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:track/repositories/favourites_repository.dart';
import 'package:track/repositories/mock_shows_repository.dart';
import 'package:track/repositories/shows_repository.dart';
import 'package:track/repositories/tmdb_shows_repository.dart';
import 'package:track/repositories/watched_repository.dart';

final _showsRepository = TMDBShowsRepository();
// final _showsRepository = MockShowsRepository();

final showsRepositoryProvider = Provider<ShowsRepository>((ref) {
  return _showsRepository;
});

final favouritesRepositoryProvider = Provider<FavouritesRepository>((ref) {
  throw UnimplementedError();
});

final watchedRepositoryProvider = Provider<WatchedRepository>((ref) {
  throw UnimplementedError();
});
