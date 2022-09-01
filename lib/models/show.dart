import 'package:freezed_annotation/freezed_annotation.dart';

part 'show.freezed.dart';
part 'show.g.dart';

@freezed
class Show with _$Show {
  const factory Show({
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'name') @Default('Unknown Name') String name,
    @JsonKey(name: 'original_language') @Default('Unknown Language') String language,
    @JsonKey(name: 'overview') @Default('Unknown Overview') String overview,
    @JsonKey(name: 'first_air_date') @Default('Unknown Air Date') String firstAirDate,
    @JsonKey(name: 'backdrop_path') @Default('') String backdropPath,
    @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @JsonKey(name: 'popularity') @Default(-1) double popularity,
    @JsonKey(name: 'vote_average') @Default(-1) num voteAverage,
    @JsonKey(name: 'vote_count') @Default(-1) int voteCount,
    @JsonKey(name: 'genre_ids') @Default([]) List<int> genreIds,
    @JsonKey(name: 'origin_country') @Default([]) List<String> originCountry,
  }) = _Show;

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);
}
