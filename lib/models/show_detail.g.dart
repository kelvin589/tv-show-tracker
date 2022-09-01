// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShowDetail _$$_ShowDetailFromJson(Map<String, dynamic> json) =>
    _$_ShowDetail(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? 'Unknown Name',
      language: json['original_language'] as String? ?? 'Unknown Language',
      overview: json['overview'] as String? ?? 'Unknown Overview',
      firstAirDate: json['first_air_date'] as String? ?? 'Unknown Air Date',
      backdropPath: json['backdrop_path'] as String? ?? 'Unknown Backdrop Path',
      posterPath: json['poster_path'] as String? ?? 'Unknown Poster Path',
      popularity: (json['popularity'] as num?)?.toDouble() ?? -1,
      voteAverage: json['vote_average'] as num? ?? -1,
      voteCount: json['vote_count'] as int? ?? -1,
      originCountry: (json['origin_country'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      numberOfEpisodes: json['number_of_episodes'] as int? ?? -1,
      numberOfSeasons: json['number_of_seasons'] as int? ?? -1,
      status: json['status'] as String? ?? 'Unknown Status',
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      type: json['type'] as String? ?? 'Unknown Type',
    );

Map<String, dynamic> _$$_ShowDetailToJson(_$_ShowDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'original_language': instance.language,
      'overview': instance.overview,
      'first_air_date': instance.firstAirDate,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'origin_country': instance.originCountry,
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'status': instance.status,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'type': instance.type,
    };
