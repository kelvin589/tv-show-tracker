// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Episode _$$_EpisodeFromJson(Map<String, dynamic> json) => _$_Episode(
      airDate: json['air_date'] as String? ?? 'Unknown Air Date',
      episodeNumber: json['episode_number'] as int? ?? -1,
      name: json['name'] as String? ?? 'Unknown Name',
      overview: json['overview'] as String? ?? 'No Overview',
      id: json['id'] as int? ?? -1,
      seasonNumber: json['season_number'] as int? ?? -1,
      stillPath: json['still_path'] as String? ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? -1,
      voteCount: json['vote_count'] as int? ?? -1,
    );

Map<String, dynamic> _$$_EpisodeToJson(_$_Episode instance) =>
    <String, dynamic>{
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
