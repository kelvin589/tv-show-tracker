// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Season _$$_SeasonFromJson(Map<String, dynamic> json) => _$_Season(
      name: json['name'] as String? ?? 'Unknown Name',
      overview: json['overview'] as String? ?? 'No Overview',
      id: json['id'] as int? ?? -1,
      seasonNumber: json['season_number'] as int? ?? -1,
      posterPath: json['poster_path'] as String? ?? '',
      episodes: (json['episodes'] as List<dynamic>?)
              ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SeasonToJson(_$_Season instance) => <String, dynamic>{
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'season_number': instance.seasonNumber,
      'poster_path': instance.posterPath,
      'episodes': instance.episodes,
    };
