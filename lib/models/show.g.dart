// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Show _$$_ShowFromJson(Map<String, dynamic> json) => _$_Show(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? 'Unknown Name',
      language: json['original_language'] as String? ?? 'Unknown Language',
      overview: json['overview'] as String? ?? 'Unknown Overview',
      firstAirDate: json['first_air_date'] as String? ?? 'Unknown Air Date',
      backdropPath: json['backdrop_path'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? -1,
      voteAverage: json['vote_average'] as num? ?? -1,
      voteCount: json['vote_count'] as int? ?? -1,
      genreIds: (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      originCountry: (json['origin_country'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ShowToJson(_$_Show instance) => <String, dynamic>{
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
      'genre_ids': instance.genreIds,
      'origin_country': instance.originCountry,
    };
