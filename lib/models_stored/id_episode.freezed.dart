// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'id_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IDEpisode _$IDEpisodeFromJson(Map<String, dynamic> json) {
  return _IDEpisode.fromJson(json);
}

/// @nodoc
mixin _$IDEpisode {
  int get showId => throw _privateConstructorUsedError;
  int get seasonNumber => throw _privateConstructorUsedError;
  int get episodeNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IDEpisodeCopyWith<IDEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IDEpisodeCopyWith<$Res> {
  factory $IDEpisodeCopyWith(IDEpisode value, $Res Function(IDEpisode) then) =
      _$IDEpisodeCopyWithImpl<$Res>;
  $Res call({int showId, int seasonNumber, int episodeNumber});
}

/// @nodoc
class _$IDEpisodeCopyWithImpl<$Res> implements $IDEpisodeCopyWith<$Res> {
  _$IDEpisodeCopyWithImpl(this._value, this._then);

  final IDEpisode _value;
  // ignore: unused_field
  final $Res Function(IDEpisode) _then;

  @override
  $Res call({
    Object? showId = freezed,
    Object? seasonNumber = freezed,
    Object? episodeNumber = freezed,
  }) {
    return _then(_value.copyWith(
      showId: showId == freezed
          ? _value.showId
          : showId // ignore: cast_nullable_to_non_nullable
              as int,
      seasonNumber: seasonNumber == freezed
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      episodeNumber: episodeNumber == freezed
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_IDEpisodeCopyWith<$Res> implements $IDEpisodeCopyWith<$Res> {
  factory _$$_IDEpisodeCopyWith(
          _$_IDEpisode value, $Res Function(_$_IDEpisode) then) =
      __$$_IDEpisodeCopyWithImpl<$Res>;
  @override
  $Res call({int showId, int seasonNumber, int episodeNumber});
}

/// @nodoc
class __$$_IDEpisodeCopyWithImpl<$Res> extends _$IDEpisodeCopyWithImpl<$Res>
    implements _$$_IDEpisodeCopyWith<$Res> {
  __$$_IDEpisodeCopyWithImpl(
      _$_IDEpisode _value, $Res Function(_$_IDEpisode) _then)
      : super(_value, (v) => _then(v as _$_IDEpisode));

  @override
  _$_IDEpisode get _value => super._value as _$_IDEpisode;

  @override
  $Res call({
    Object? showId = freezed,
    Object? seasonNumber = freezed,
    Object? episodeNumber = freezed,
  }) {
    return _then(_$_IDEpisode(
      showId: showId == freezed
          ? _value.showId
          : showId // ignore: cast_nullable_to_non_nullable
              as int,
      seasonNumber: seasonNumber == freezed
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      episodeNumber: episodeNumber == freezed
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_IDEpisode implements _IDEpisode {
  const _$_IDEpisode(
      {this.showId = -1, this.seasonNumber = -1, this.episodeNumber = -1});

  factory _$_IDEpisode.fromJson(Map<String, dynamic> json) =>
      _$$_IDEpisodeFromJson(json);

  @override
  @JsonKey()
  final int showId;
  @override
  @JsonKey()
  final int seasonNumber;
  @override
  @JsonKey()
  final int episodeNumber;

  @override
  String toString() {
    return 'IDEpisode(showId: $showId, seasonNumber: $seasonNumber, episodeNumber: $episodeNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IDEpisode &&
            const DeepCollectionEquality().equals(other.showId, showId) &&
            const DeepCollectionEquality()
                .equals(other.seasonNumber, seasonNumber) &&
            const DeepCollectionEquality()
                .equals(other.episodeNumber, episodeNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showId),
      const DeepCollectionEquality().hash(seasonNumber),
      const DeepCollectionEquality().hash(episodeNumber));

  @JsonKey(ignore: true)
  @override
  _$$_IDEpisodeCopyWith<_$_IDEpisode> get copyWith =>
      __$$_IDEpisodeCopyWithImpl<_$_IDEpisode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IDEpisodeToJson(
      this,
    );
  }
}

abstract class _IDEpisode implements IDEpisode {
  const factory _IDEpisode(
      {final int showId,
      final int seasonNumber,
      final int episodeNumber}) = _$_IDEpisode;

  factory _IDEpisode.fromJson(Map<String, dynamic> json) =
      _$_IDEpisode.fromJson;

  @override
  int get showId;
  @override
  int get seasonNumber;
  @override
  int get episodeNumber;
  @override
  @JsonKey(ignore: true)
  _$$_IDEpisodeCopyWith<_$_IDEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}
