import 'dart:convert';

import 'package:track/models/episode.dart';
import 'package:track/models/failure.dart';
import 'package:track/models/results.dart';
import 'package:track/models/season.dart';
import 'package:track/models/show_detail.dart';
import 'package:track/repositories/shows_repository.dart';
import 'package:flutter/services.dart' show rootBundle;

class MockShowsRepository implements ShowsRepository {
  @override
  String imageSrc(String path, {String size = 'original'}) =>
      'https://image.tmdb.org/t/p/$size$path';

  Future<T> _get<T>(
      String url, T Function(Map<String, dynamic> jsonData) builder) async {
    try {
      final String loadedData = await rootBundle.loadString(url);
      final Map<String, dynamic> jsonData = json.decode(loadedData);
      return builder(jsonData);
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<Results> getPopular({int page = 1}) {
    return _get('assets/data/popular.json', (jsonData) {
      final result = Results.fromJson(jsonData);
      return result.copyWith(
        page: 1,
        totalPages: 1,
        totalResults: result.shows.length,
      );
    });
  }

  @override
  Future<List<Season>> getSeasons(int id, int numberOfSeasons) {
    return _get(
        'assets/data/season.json', (jsonData) => [Season.fromJson(jsonData)]);
  }

  @override
  Future<Season> getSeason(int id, int season) {
    return _get(
        'assets/data/season.json', (jsonData) => Season.fromJson(jsonData));
  }

  @override
  Future<Results> getTop({int page = 1}) {
    return _get('assets/data/top_rated.json', (jsonData) {
      final result = Results.fromJson(jsonData);
      return result.copyWith(
        page: 1,
        totalPages: 1,
        totalResults: result.shows.length,
      );
    });
  }

  @override
  Future<Results> search(String query, {int page = 1}) async {
    final popular = await getPopular();
    final top = await getTop();
    final results = [...popular.shows, ...top.shows]
      ..retainWhere((show) => show.name.toLowerCase().contains(query));
    return Results(
      page: 1,
      totalPages: 1,
      totalResults: results.length,
      shows: results,
    );
  }

  @override
  Future<ShowDetail> getShow(int id) {
    return _get(
        'assets/data/show.json', (jsonData) => ShowDetail.fromJson(jsonData));
  }

  @override
  Future<Episode> getEpisode(int id, int season, int episode) {
    return _get('assets/data/season.json',
        (jsonData) => [Season.fromJson(jsonData)].first.episodes.first);
  }
  
  @override
  Future<Results> getRecommendations(int id, {int page = 1}) {
    return getPopular();
  }
}
