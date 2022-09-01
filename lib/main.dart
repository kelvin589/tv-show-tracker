import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track/pages/home_page.dart';
import 'package:track/providers/state.dart';
import 'package:track/repositories/sembast_favourites_repository.dart';
import 'package:track/repositories/sembast_watched_repository.dart';
import 'package:track/services/sembast_data_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SembastDataStore.instance;
  final database = SembastDataStore.database;

  runApp(
    ProviderScope(
      overrides: [
        favouritesRepositoryProvider.overrideWithValue(
          SembastFavouritesRepository(database),
        ),
        watchedRepositoryProvider.overrideWithValue(
          SembastWatchedRepository(database),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
