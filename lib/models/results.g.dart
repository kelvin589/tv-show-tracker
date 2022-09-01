// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Results _$$_ResultsFromJson(Map<String, dynamic> json) => _$_Results(
      page: json['page'] as int? ?? -1,
      totalPages: json['total_pages'] as int? ?? -1,
      totalResults: json['total_results'] as int? ?? -1,
      shows: (json['results'] as List<dynamic>?)
              ?.map((e) => Show.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ResultsToJson(_$_Results instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.shows,
    };
