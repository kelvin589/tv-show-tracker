import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
class Episode with _$Episode {
  const factory Episode({
    @JsonKey(name: 'air_date') @Default('Unknown Air Date') String airDate,
    @JsonKey(name: 'episode_number') @Default(-1) int episodeNumber,
    @Default('Unknown Name') String name,
    @Default('No Overview') String overview,
    @Default(-1) int id,
    @JsonKey(name: 'season_number') @Default(-1) int seasonNumber,
    @JsonKey(name: 'still_path') @Default('') String stillPath,
    @JsonKey(name: 'vote_average') @Default(-1) double voteAverage,
    @JsonKey(name: 'vote_count') @Default(-1) int voteCount,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}

extension CheckAired on Episode {
  bool hasAired() {
    final airDate = DateTime.tryParse(this.airDate);
    if (airDate != null) {
      return !airDate.isAfter(DateTime.now());
    }
    return true;
  }
}
