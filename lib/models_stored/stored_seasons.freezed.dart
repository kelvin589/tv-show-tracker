// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stored_seasons.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoredSeasons _$StoredSeasonsFromJson(Map<String, dynamic> json) {
  return _StoredSeasons.fromJson(json);
}

/// @nodoc
mixin _$StoredSeasons {
  int get total => throw _privateConstructorUsedError;
  int get watched => throw _privateConstructorUsedError;
  List<String> get seasons => throw _privateConstructorUsedError;
  IDEpisode? get nextEpisode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoredSeasonsCopyWith<StoredSeasons> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoredSeasonsCopyWith<$Res> {
  factory $StoredSeasonsCopyWith(
          StoredSeasons value, $Res Function(StoredSeasons) then) =
      _$StoredSeasonsCopyWithImpl<$Res>;
  $Res call(
      {int total, int watched, List<String> seasons, IDEpisode? nextEpisode});

  $IDEpisodeCopyWith<$Res>? get nextEpisode;
}

/// @nodoc
class _$StoredSeasonsCopyWithImpl<$Res>
    implements $StoredSeasonsCopyWith<$Res> {
  _$StoredSeasonsCopyWithImpl(this._value, this._then);

  final StoredSeasons _value;
  // ignore: unused_field
  final $Res Function(StoredSeasons) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? watched = freezed,
    Object? seasons = freezed,
    Object? nextEpisode = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      watched: watched == freezed
          ? _value.watched
          : watched // ignore: cast_nullable_to_non_nullable
              as int,
      seasons: seasons == freezed
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nextEpisode: nextEpisode == freezed
          ? _value.nextEpisode
          : nextEpisode // ignore: cast_nullable_to_non_nullable
              as IDEpisode?,
    ));
  }

  @override
  $IDEpisodeCopyWith<$Res>? get nextEpisode {
    if (_value.nextEpisode == null) {
      return null;
    }

    return $IDEpisodeCopyWith<$Res>(_value.nextEpisode!, (value) {
      return _then(_value.copyWith(nextEpisode: value));
    });
  }
}

/// @nodoc
abstract class _$$_StoredSeasonsCopyWith<$Res>
    implements $StoredSeasonsCopyWith<$Res> {
  factory _$$_StoredSeasonsCopyWith(
          _$_StoredSeasons value, $Res Function(_$_StoredSeasons) then) =
      __$$_StoredSeasonsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int total, int watched, List<String> seasons, IDEpisode? nextEpisode});

  @override
  $IDEpisodeCopyWith<$Res>? get nextEpisode;
}

/// @nodoc
class __$$_StoredSeasonsCopyWithImpl<$Res>
    extends _$StoredSeasonsCopyWithImpl<$Res>
    implements _$$_StoredSeasonsCopyWith<$Res> {
  __$$_StoredSeasonsCopyWithImpl(
      _$_StoredSeasons _value, $Res Function(_$_StoredSeasons) _then)
      : super(_value, (v) => _then(v as _$_StoredSeasons));

  @override
  _$_StoredSeasons get _value => super._value as _$_StoredSeasons;

  @override
  $Res call({
    Object? total = freezed,
    Object? watched = freezed,
    Object? seasons = freezed,
    Object? nextEpisode = freezed,
  }) {
    return _then(_$_StoredSeasons(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      watched: watched == freezed
          ? _value.watched
          : watched // ignore: cast_nullable_to_non_nullable
              as int,
      seasons: seasons == freezed
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nextEpisode: nextEpisode == freezed
          ? _value.nextEpisode
          : nextEpisode // ignore: cast_nullable_to_non_nullable
              as IDEpisode?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_StoredSeasons implements _StoredSeasons {
  const _$_StoredSeasons(
      {this.total = -1,
      this.watched = -1,
      final List<String> seasons = const [],
      this.nextEpisode})
      : _seasons = seasons;

  factory _$_StoredSeasons.fromJson(Map<String, dynamic> json) =>
      _$$_StoredSeasonsFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int watched;
  final List<String> _seasons;
  @override
  @JsonKey()
  List<String> get seasons {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seasons);
  }

  @override
  final IDEpisode? nextEpisode;

  @override
  String toString() {
    return 'StoredSeasons(total: $total, watched: $watched, seasons: $seasons, nextEpisode: $nextEpisode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoredSeasons &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.watched, watched) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons) &&
            const DeepCollectionEquality()
                .equals(other.nextEpisode, nextEpisode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(watched),
      const DeepCollectionEquality().hash(_seasons),
      const DeepCollectionEquality().hash(nextEpisode));

  @JsonKey(ignore: true)
  @override
  _$$_StoredSeasonsCopyWith<_$_StoredSeasons> get copyWith =>
      __$$_StoredSeasonsCopyWithImpl<_$_StoredSeasons>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoredSeasonsToJson(
      this,
    );
  }
}

abstract class _StoredSeasons implements StoredSeasons {
  const factory _StoredSeasons(
      {final int total,
      final int watched,
      final List<String> seasons,
      final IDEpisode? nextEpisode}) = _$_StoredSeasons;

  factory _StoredSeasons.fromJson(Map<String, dynamic> json) =
      _$_StoredSeasons.fromJson;

  @override
  int get total;
  @override
  int get watched;
  @override
  List<String> get seasons;
  @override
  IDEpisode? get nextEpisode;
  @override
  @JsonKey(ignore: true)
  _$$_StoredSeasonsCopyWith<_$_StoredSeasons> get copyWith =>
      throw _privateConstructorUsedError;
}
