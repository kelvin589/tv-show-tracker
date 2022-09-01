import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:track/models/show.dart';

part 'page_state.freezed.dart';

@freezed
class PageState with _$PageState {
  const factory PageState.data(List<Show> shows, bool endReached) = _Data;
  const factory PageState.loading(List<Show> shows) = _Loading;
  const factory PageState.error(String error) = _Error;
}