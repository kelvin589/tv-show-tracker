// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoredSeason _$$_StoredSeasonFromJson(Map<String, dynamic> json) =>
    _$_StoredSeason(
      number: json['number'] as int? ?? -1,
      total: json['total'] as int? ?? -1,
      watched: json['watched'] as int? ?? -1,
      episodes: (json['episodes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_StoredSeasonToJson(_$_StoredSeason instance) =>
    <String, dynamic>{
      'number': instance.number,
      'total': instance.total,
      'watched': instance.watched,
      'episodes': instance.episodes,
    };
