// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stored_season.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoredSeason _$StoredSeasonFromJson(Map<String, dynamic> json) {
  return _StoredSeason.fromJson(json);
}

/// @nodoc
mixin _$StoredSeason {
  int get number => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get watched => throw _privateConstructorUsedError;
  List<String> get episodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoredSeasonCopyWith<StoredSeason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoredSeasonCopyWith<$Res> {
  factory $StoredSeasonCopyWith(
          StoredSeason value, $Res Function(StoredSeason) then) =
      _$StoredSeasonCopyWithImpl<$Res>;
  $Res call({int number, int total, int watched, List<String> episodes});
}

/// @nodoc
class _$StoredSeasonCopyWithImpl<$Res> implements $StoredSeasonCopyWith<$Res> {
  _$StoredSeasonCopyWithImpl(this._value, this._then);

  final StoredSeason _value;
  // ignore: unused_field
  final $Res Function(StoredSeason) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? total = freezed,
    Object? watched = freezed,
    Object? episodes = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      watched: watched == freezed
          ? _value.watched
          : watched // ignore: cast_nullable_to_non_nullable
              as int,
      episodes: episodes == freezed
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_StoredSeasonCopyWith<$Res>
    implements $StoredSeasonCopyWith<$Res> {
  factory _$$_StoredSeasonCopyWith(
          _$_StoredSeason value, $Res Function(_$_StoredSeason) then) =
      __$$_StoredSeasonCopyWithImpl<$Res>;
  @override
  $Res call({int number, int total, int watched, List<String> episodes});
}

/// @nodoc
class __$$_StoredSeasonCopyWithImpl<$Res>
    extends _$StoredSeasonCopyWithImpl<$Res>
    implements _$$_StoredSeasonCopyWith<$Res> {
  __$$_StoredSeasonCopyWithImpl(
      _$_StoredSeason _value, $Res Function(_$_StoredSeason) _then)
      : super(_value, (v) => _then(v as _$_StoredSeason));

  @override
  _$_StoredSeason get _value => super._value as _$_StoredSeason;

  @override
  $Res call({
    Object? number = freezed,
    Object? total = freezed,
    Object? watched = freezed,
    Object? episodes = freezed,
  }) {
    return _then(_$_StoredSeason(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      watched: watched == freezed
          ? _value.watched
          : watched // ignore: cast_nullable_to_non_nullable
              as int,
      episodes: episodes == freezed
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoredSeason implements _StoredSeason {
  const _$_StoredSeason(
      {this.number = -1,
      this.total = -1,
      this.watched = -1,
      final List<String> episodes = const []})
      : _episodes = episodes;

  factory _$_StoredSeason.fromJson(Map<String, dynamic> json) =>
      _$$_StoredSeasonFromJson(json);

  @override
  @JsonKey()
  final int number;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int watched;
  final List<String> _episodes;
  @override
  @JsonKey()
  List<String> get episodes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  @override
  String toString() {
    return 'StoredSeason(number: $number, total: $total, watched: $watched, episodes: $episodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoredSeason &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.watched, watched) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(watched),
      const DeepCollectionEquality().hash(_episodes));

  @JsonKey(ignore: true)
  @override
  _$$_StoredSeasonCopyWith<_$_StoredSeason> get copyWith =>
      __$$_StoredSeasonCopyWithImpl<_$_StoredSeason>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoredSeasonToJson(
      this,
    );
  }
}

abstract class _StoredSeason implements StoredSeason {
  const factory _StoredSeason(
      {final int number,
      final int total,
      final int watched,
      final List<String> episodes}) = _$_StoredSeason;

  factory _StoredSeason.fromJson(Map<String, dynamic> json) =
      _$_StoredSeason.fromJson;

  @override
  int get number;
  @override
  int get total;
  @override
  int get watched;
  @override
  List<String> get episodes;
  @override
  @JsonKey(ignore: true)
  _$$_StoredSeasonCopyWith<_$_StoredSeason> get copyWith =>
      throw _privateConstructorUsedError;
}
