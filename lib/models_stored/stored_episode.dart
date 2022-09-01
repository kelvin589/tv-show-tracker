import 'package:freezed_annotation/freezed_annotation.dart';

part 'stored_episode.freezed.dart';
part 'stored_episode.g.dart';

@freezed
class StoredEpisode with _$StoredEpisode {
  const factory StoredEpisode({
    @Default(-1) int number,
  }) = _StoredEpisode;

  factory StoredEpisode.fromJson(Map<String, dynamic> json) => _$StoredEpisodeFromJson(json);
}
