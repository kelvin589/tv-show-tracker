import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:track/models/genre.dart';
import 'package:track/models/show.dart';

part 'show_detail.freezed.dart';
part 'show_detail.g.dart';

@freezed
class ShowDetail with _$ShowDetail {
  @JsonSerializable(explicitToJson: true)
  const factory ShowDetail({
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'name') @Default('Unknown Name') String name,
    @JsonKey(name: 'original_language')
    @Default('Unknown Language')
        String language,
    @JsonKey(name: 'overview') @Default('Unknown Overview') String overview,
    @JsonKey(name: 'first_air_date')
    @Default('Unknown Air Date')
        String firstAirDate,
    @JsonKey(name: 'backdrop_path')
    @Default('Unknown Backdrop Path')
        String backdropPath,
    @JsonKey(name: 'poster_path')
    @Default('Unknown Poster Path')
        String posterPath,
    @JsonKey(name: 'popularity') @Default(-1) double popularity,
    @JsonKey(name: 'vote_average') @Default(-1) num voteAverage,
    @JsonKey(name: 'vote_count') @Default(-1) int voteCount,
    @JsonKey(name: 'origin_country') @Default([]) List<String> originCountry,
    @JsonKey(name: 'number_of_episodes') @Default(-1) int numberOfEpisodes,
    @JsonKey(name: 'number_of_seasons') @Default(-1) int numberOfSeasons,
    @JsonKey(name: 'status') @Default('Unknown Status') String status,
    @JsonKey(name: 'genres') @Default([]) List<Genre> genres,
    @JsonKey(name: 'type') @Default('Unknown Type') String type,
  }) = _ShowDetail;

  factory ShowDetail.fromJson(Map<String, dynamic> json) =>
      _$ShowDetailFromJson(json);
}

extension ShowDetailToShow on ShowDetail {
  Show toShow() {
    final json = toJson();
    json['genre_ids'] = ((json['genres'] as Iterable<dynamic>)
        .map((e) => Genre.fromJson(e))).map<int>((e) => e.id).toList();
    return Show.fromJson(json);
  }
}
