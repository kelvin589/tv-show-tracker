import 'package:track/models/episode.dart';
import 'package:track/models/results.dart';
import 'package:track/models/season.dart';
import 'package:track/models/show_detail.dart';

abstract class ShowsRepository {
  Future<ShowDetail> getShow(int id);
  String imageSrc(String path, {String size});
  Future<Results> getPopular({int page = 1});
  Future<List<Season>> getSeasons(int id, int numberOfSeasons);
  Future<Season> getSeason(int id, int season);
  Future<Episode> getEpisode(int id, int season, int episode);
  Future<Results> getTop({int page = 1});
  Future<Results> search(String query, {int page = 1});
  Future<Results> getRecommendations(int id, {int page = 1});
}