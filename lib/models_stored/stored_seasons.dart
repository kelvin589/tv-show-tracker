import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:track/models_stored/id_episode.dart';

part 'stored_seasons.freezed.dart';
part 'stored_seasons.g.dart';

@freezed
class StoredSeasons with _$StoredSeasons {
  @JsonSerializable(explicitToJson: true)
  const factory StoredSeasons({
    @Default(-1) int total,
    @Default(-1) int watched,
    @Default([]) List<String> seasons,
    IDEpisode? nextEpisode,
  }) = _StoredSeasons;

  factory StoredSeasons.fromJson(Map<String, dynamic> json) =>
      _$StoredSeasonsFromJson(json);
}
