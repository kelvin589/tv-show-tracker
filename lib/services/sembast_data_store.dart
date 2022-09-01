import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastDataStore {
  static const String _favouritesDb = 'favourites.db';
  static final DatabaseFactory _databaseFactory = databaseFactoryIo;
  static SembastDataStore? _instance;
  
  static late final Database database;

  static Future<SembastDataStore> get instance async {
    if (_instance == null) {
      _instance = SembastDataStore._privateConstructor();
      await _init();
    }
    return _instance!;
  }

  SembastDataStore._privateConstructor();

  static Future<void> _init() async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var databasePath = join(dir.path, _favouritesDb);
    debugPrint(databasePath);
    database = await _databaseFactory.openDatabase(databasePath);
  }
}