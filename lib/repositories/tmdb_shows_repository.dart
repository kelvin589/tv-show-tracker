import 'dart:convert';
import 'dart:io';

import 'package:track/models/episode.dart';
import 'package:track/models/failure.dart';
import 'package:track/models/results.dart';
import 'package:track/models/season.dart';
import 'package:track/models/show_detail.dart';
import 'package:track/repositories/shows_repository.dart';
import 'package:track/services/api_keys.dart';
import 'package:track/services/tmdb_api.dart';
import 'package:http/http.dart' as http;

class TMDBShowsRepository implements ShowsRepository {
  final TMDBApi api = TMDBApi(APIKeys.tmdbApiKey);

  @override
  String imageSrc(String path, {String size = 'original'}) =>
      api.imageSrc(path, size);

  Future<T> _get<T>(Uri url, T Function(dynamic json) builder) async {
    try {
      final response = await http.get(url);
      switch (response.statusCode) {
        case 200:
          final jsonResponse = json.decode(response.body);
          return builder(jsonResponse);
        case 401:
          throw Failure('Invalid API key');
        case 404:
          throw Failure('Requested resource cannot be found');
        default:
          throw Failure('Unknown Status Code');
      }
    } on SocketException {
      throw Failure('No Internet Connection');
    } on FormatException {
      throw Failure('Bad Response Format');
    }
  }

  @override
  Future<ShowDetail> getShow(int id) async {
    return _get(api.details(id), (json) => ShowDetail.fromJson(json));
  }

  @override
  Future<Results> getPopular({int page = 1}) async {
    return _get(api.popular(page: page), (json) => Results.fromJson(json));
  }

  @override
  Future<Season> getSeason(int id, int season) {
    return _get(api.season(id, season), (json) => Season.fromJson(json));
  }

  @override
  Future<List<Season>> getSeasons(int id, int numberOfSeasons) async {
    final List<Season> seasons = [];

    for (int season = 1; season <= numberOfSeasons; season++) {
      seasons.add(await getSeason(id, season));
    }

    return Future.value(seasons);
  }
  
  @override
  Future<Results> getTop({int page = 1}) {
    return _get(api.top(page: page), (json) => Results.fromJson(json));
  }
  
  @override
  Future<Results> search(String query, {int page = 1}) {
    return _get(api.search(query, page: page), (json) => Results.fromJson(json));
  }

  @override
  Future<Episode> getEpisode(int id, int season, int episode) {
    return _get(api.episode(id, season, episode), (json) => Episode.fromJson(json));
  }
  
  @override
  Future<Results> getRecommendations(int id, {int page = 1}) {
    return _get(api.recommendations(id, page: page), (json) => Results.fromJson(json));
  }
}
