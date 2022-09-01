// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_seasons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoredSeasons _$$_StoredSeasonsFromJson(Map<String, dynamic> json) =>
    _$_StoredSeasons(
      total: json['total'] as int? ?? -1,
      watched: json['watched'] as int? ?? -1,
      seasons: (json['seasons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      nextEpisode: json['nextEpisode'] == null
          ? null
          : IDEpisode.fromJson(json['nextEpisode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoredSeasonsToJson(_$_StoredSeasons instance) =>
    <String, dynamic>{
      'total': instance.total,
      'watched': instance.watched,
      'seasons': instance.seasons,
      'nextEpisode': instance.nextEpisode?.toJson(),
    };
