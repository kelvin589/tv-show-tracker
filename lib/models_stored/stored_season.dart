import 'package:freezed_annotation/freezed_annotation.dart';

part 'stored_season.freezed.dart';
part 'stored_season.g.dart';

@freezed
class StoredSeason with _$StoredSeason {
  const factory StoredSeason({
    @Default(-1) int number,
    @Default(-1) int total,
    @Default(-1) int watched,
    @Default([]) List<String> episodes,
  }) = _StoredSeason;

  factory StoredSeason.fromJson(Map<String, dynamic> json) =>
      _$StoredSeasonFromJson(json);
}
