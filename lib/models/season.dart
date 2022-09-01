import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:track/models/episode.dart';

part 'season.freezed.dart';
part 'season.g.dart';

@freezed
class Season with _$Season {
  const factory Season({
    @Default('Unknown Name') String name,
    @Default('No Overview') String overview,
    @Default(-1) int id,
    @JsonKey(name: 'season_number') @Default(-1) int seasonNumber,
    @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @Default([]) List<Episode> episodes,
  }) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) =>
      _$SeasonFromJson(json);
}