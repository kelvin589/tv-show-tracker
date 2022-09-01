// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stored_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoredEpisode _$StoredEpisodeFromJson(Map<String, dynamic> json) {
  return _StoredEpisode.fromJson(json);
}

/// @nodoc
mixin _$StoredEpisode {
  int get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoredEpisodeCopyWith<StoredEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoredEpisodeCopyWith<$Res> {
  factory $StoredEpisodeCopyWith(
          StoredEpisode value, $Res Function(StoredEpisode) then) =
      _$StoredEpisodeCopyWithImpl<$Res>;
  $Res call({int number});
}

/// @nodoc
class _$StoredEpisodeCopyWithImpl<$Res>
    implements $StoredEpisodeCopyWith<$Res> {
  _$StoredEpisodeCopyWithImpl(this._value, this._then);

  final StoredEpisode _value;
  // ignore: unused_field
  final $Res Function(StoredEpisode) _then;

  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_StoredEpisodeCopyWith<$Res>
    implements $StoredEpisodeCopyWith<$Res> {
  factory _$$_StoredEpisodeCopyWith(
          _$_StoredEpisode value, $Res Function(_$_StoredEpisode) then) =
      __$$_StoredEpisodeCopyWithImpl<$Res>;
  @override
  $Res call({int number});
}

/// @nodoc
class __$$_StoredEpisodeCopyWithImpl<$Res>
    extends _$StoredEpisodeCopyWithImpl<$Res>
    implements _$$_StoredEpisodeCopyWith<$Res> {
  __$$_StoredEpisodeCopyWithImpl(
      _$_StoredEpisode _value, $Res Function(_$_StoredEpisode) _then)
      : super(_value, (v) => _then(v as _$_StoredEpisode));

  @override
  _$_StoredEpisode get _value => super._value as _$_StoredEpisode;

  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(_$_StoredEpisode(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoredEpisode implements _StoredEpisode {
  const _$_StoredEpisode({this.number = -1});

  factory _$_StoredEpisode.fromJson(Map<String, dynamic> json) =>
      _$$_StoredEpisodeFromJson(json);

  @override
  @JsonKey()
  final int number;

  @override
  String toString() {
    return 'StoredEpisode(number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoredEpisode &&
            const DeepCollectionEquality().equals(other.number, number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(number));

  @JsonKey(ignore: true)
  @override
  _$$_StoredEpisodeCopyWith<_$_StoredEpisode> get copyWith =>
      __$$_StoredEpisodeCopyWithImpl<_$_StoredEpisode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoredEpisodeToJson(
      this,
    );
  }
}

abstract class _StoredEpisode implements StoredEpisode {
  const factory _StoredEpisode({final int number}) = _$_StoredEpisode;

  factory _StoredEpisode.fromJson(Map<String, dynamic> json) =
      _$_StoredEpisode.fromJson;

  @override
  int get number;
  @override
  @JsonKey(ignore: true)
  _$$_StoredEpisodeCopyWith<_$_StoredEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}
