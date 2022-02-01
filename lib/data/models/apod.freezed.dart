// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'apod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Apod _$ApodFromJson(Map<String, dynamic> json) {
  return _Apod.fromJson(json);
}

/// @nodoc
class _$ApodTearOff {
  const _$ApodTearOff();

  _Apod call(
      {@JsonKey(name: 'title') required String title,
      @JsonKey(name: 'explanation') required String explanation,
      @JsonKey(name: 'url') required String imageUrl}) {
    return _Apod(
      title: title,
      explanation: explanation,
      imageUrl: imageUrl,
    );
  }

  Apod fromJson(Map<String, Object?> json) {
    return Apod.fromJson(json);
  }
}

/// @nodoc
const $Apod = _$ApodTearOff();

/// @nodoc
mixin _$Apod {
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'explanation')
  String get explanation => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApodCopyWith<Apod> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApodCopyWith<$Res> {
  factory $ApodCopyWith(Apod value, $Res Function(Apod) then) =
      _$ApodCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'explanation') String explanation,
      @JsonKey(name: 'url') String imageUrl});
}

/// @nodoc
class _$ApodCopyWithImpl<$Res> implements $ApodCopyWith<$Res> {
  _$ApodCopyWithImpl(this._value, this._then);

  final Apod _value;
  // ignore: unused_field
  final $Res Function(Apod) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? explanation = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: explanation == freezed
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ApodCopyWith<$Res> implements $ApodCopyWith<$Res> {
  factory _$ApodCopyWith(_Apod value, $Res Function(_Apod) then) =
      __$ApodCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'explanation') String explanation,
      @JsonKey(name: 'url') String imageUrl});
}

/// @nodoc
class __$ApodCopyWithImpl<$Res> extends _$ApodCopyWithImpl<$Res>
    implements _$ApodCopyWith<$Res> {
  __$ApodCopyWithImpl(_Apod _value, $Res Function(_Apod) _then)
      : super(_value, (v) => _then(v as _Apod));

  @override
  _Apod get _value => super._value as _Apod;

  @override
  $Res call({
    Object? title = freezed,
    Object? explanation = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_Apod(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: explanation == freezed
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Apod extends _Apod {
  const _$_Apod(
      {@JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'explanation') required this.explanation,
      @JsonKey(name: 'url') required this.imageUrl})
      : super._();

  factory _$_Apod.fromJson(Map<String, dynamic> json) => _$$_ApodFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'explanation')
  final String explanation;
  @override
  @JsonKey(name: 'url')
  final String imageUrl;

  @override
  String toString() {
    return 'Apod(title: $title, explanation: $explanation, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Apod &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.explanation, explanation) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(explanation),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$ApodCopyWith<_Apod> get copyWith =>
      __$ApodCopyWithImpl<_Apod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApodToJson(this);
  }
}

abstract class _Apod extends Apod {
  const factory _Apod(
      {@JsonKey(name: 'title') required String title,
      @JsonKey(name: 'explanation') required String explanation,
      @JsonKey(name: 'url') required String imageUrl}) = _$_Apod;
  const _Apod._() : super._();

  factory _Apod.fromJson(Map<String, dynamic> json) = _$_Apod.fromJson;

  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'explanation')
  String get explanation;
  @override
  @JsonKey(name: 'url')
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$ApodCopyWith<_Apod> get copyWith => throw _privateConstructorUsedError;
}
