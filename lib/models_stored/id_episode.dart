import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_episode.freezed.dart';
part 'id_episode.g.dart';

@freezed
class IDEpisode with _$IDEpisode {
  @JsonSerializable(explicitToJson: true)
  const factory IDEpisode({
    @Default(-1) int showId,
    @Default(-1) int seasonNumber,
    @Default(-1) int episodeNumber,
  }) = _IDEpisode;

  factory IDEpisode.fromJson(Map<String, dynamic> json) => _$IDEpisodeFromJson(json);
}
