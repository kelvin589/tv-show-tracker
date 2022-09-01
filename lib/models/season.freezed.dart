// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'season.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Season _$SeasonFromJson(Map<String, dynamic> json) {
  return _Season.fromJson(json);
}

/// @nodoc
mixin _$Season {
  String get name => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'season_number')
  int get seasonNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String get posterPath => throw _privateConstructorUsedError;
  List<Episode> get episodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeasonCopyWith<Season> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonCopyWith<$Res> {
  factory $SeasonCopyWith(Season value, $Res Function(Season) then) =
      _$SeasonCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String overview,
      int id,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'poster_path') String posterPath,
      List<Episode> episodes});
}

/// @nodoc
class _$SeasonCopyWithImpl<$Res> implements $SeasonCopyWith<$Res> {
  _$SeasonCopyWithImpl(this._value, this._then);

  final Season _value;
  // ignore: unused_field
  final $Res Function(Season) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? overview = freezed,
    Object? id = freezed,
    Object? seasonNumber = freezed,
    Object? posterPath = freezed,
    Object? episodes = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seasonNumber: seasonNumber == freezed
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      episodes: episodes == freezed
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<Episode>,
    ));
  }
}

/// @nodoc
abstract class _$$_SeasonCopyWith<$Res> implements $SeasonCopyWith<$Res> {
  factory _$$_SeasonCopyWith(_$_Season value, $Res Function(_$_Season) then) =
      __$$_SeasonCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String overview,
      int id,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'poster_path') String posterPath,
      List<Episode> episodes});
}

/// @nodoc
class __$$_SeasonCopyWithImpl<$Res> extends _$SeasonCopyWithImpl<$Res>
    implements _$$_SeasonCopyWith<$Res> {
  __$$_SeasonCopyWithImpl(_$_Season _value, $Res Function(_$_Season) _then)
      : super(_value, (v) => _then(v as _$_Season));

  @override
  _$_Season get _value => super._value as _$_Season;

  @override
  $Res call({
    Object? name = freezed,
    Object? overview = freezed,
    Object? id = freezed,
    Object? seasonNumber = freezed,
    Object? posterPath = freezed,
    Object? episodes = freezed,
  }) {
    return _then(_$_Season(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seasonNumber: seasonNumber == freezed
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      episodes: episodes == freezed
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<Episode>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Season implements _Season {
  const _$_Season(
      {this.name = 'Unknown Name',
      this.overview = 'No Overview',
      this.id = -1,
      @JsonKey(name: 'season_number') this.seasonNumber = -1,
      @JsonKey(name: 'poster_path') this.posterPath = '',
      final List<Episode> episodes = const []})
      : _episodes = episodes;

  factory _$_Season.fromJson(Map<String, dynamic> json) =>
      _$$_SeasonFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String overview;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'season_number')
  final int seasonNumber;
  @override
  @JsonKey(name: 'poster_path')
  final String posterPath;
  final List<Episode> _episodes;
  @override
  @JsonKey()
  List<Episode> get episodes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  @override
  String toString() {
    return 'Season(name: $name, overview: $overview, id: $id, seasonNumber: $seasonNumber, posterPath: $posterPath, episodes: $episodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Season &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.overview, overview) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.seasonNumber, seasonNumber) &&
            const DeepCollectionEquality()
                .equals(other.posterPath, posterPath) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(overview),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(seasonNumber),
      const DeepCollectionEquality().hash(posterPath),
      const DeepCollectionEquality().hash(_episodes));

  @JsonKey(ignore: true)
  @override
  _$$_SeasonCopyWith<_$_Season> get copyWith =>
      __$$_SeasonCopyWithImpl<_$_Season>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SeasonToJson(
      this,
    );
  }
}

abstract class _Season implements Season {
  const factory _Season(
      {final String name,
      final String overview,
      final int id,
      @JsonKey(name: 'season_number') final int seasonNumber,
      @JsonKey(name: 'poster_path') final String posterPath,
      final List<Episode> episodes}) = _$_Season;

  factory _Season.fromJson(Map<String, dynamic> json) = _$_Season.fromJson;

  @override
  String get name;
  @override
  String get overview;
  @override
  int get id;
  @override
  @JsonKey(name: 'season_number')
  int get seasonNumber;
  @override
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @override
  List<Episode> get episodes;
  @override
  @JsonKey(ignore: true)
  _$$_SeasonCopyWith<_$_Season> get copyWith =>
      throw _privateConstructorUsedError;
}
