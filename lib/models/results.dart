import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:track/models/show.dart';

part 'results.freezed.dart';
part 'results.g.dart';

@freezed
class Results with _$Results {
  const factory Results({
    @JsonKey(name: 'page') @Default(-1) int page,
    @JsonKey(name: 'total_pages') @Default(-1) int totalPages,
    @JsonKey(name: 'total_results') @Default(-1) int totalResults,
    @JsonKey(name: 'results') @Default([]) List<Show> shows,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
}