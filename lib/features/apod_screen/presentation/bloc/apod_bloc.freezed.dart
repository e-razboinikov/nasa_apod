// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'apod_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApodEventTearOff {
  const _$ApodEventTearOff();

  LoadApodEvent loadApod({required DateTime date}) {
    return LoadApodEvent(
      date: date,
    );
  }

  LoadRandomApodEvent loadRandomApod() {
    return const LoadRandomApodEvent();
  }
}

/// @nodoc
const $ApodEvent = _$ApodEventTearOff();

/// @nodoc
mixin _$ApodEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) loadApod,
    required TResult Function() loadRandomApod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? loadApod,
    TResult Function()? loadRandomApod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? loadApod,
    TResult Function()? loadRandomApod,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApodEvent value) loadApod,
    required TResult Function(LoadRandomApodEvent value) loadRandomApod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadApodEvent value)? loadApod,
    TResult Function(LoadRandomApodEvent value)? loadRandomApod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApodEvent value)? loadApod,
    TResult Function(LoadRandomApodEvent value)? loadRandomApod,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApodEventCopyWith<$Res> {
  factory $ApodEventCopyWith(ApodEvent value, $Res Function(ApodEvent) then) =
      _$ApodEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApodEventCopyWithImpl<$Res> implements $ApodEventCopyWith<$Res> {
  _$ApodEventCopyWithImpl(this._value, this._then);

  final ApodEvent _value;
  // ignore: unused_field
  final $Res Function(ApodEvent) _then;
}

/// @nodoc
abstract class $LoadApodEventCopyWith<$Res> {
  factory $LoadApodEventCopyWith(
          LoadApodEvent value, $Res Function(LoadApodEvent) then) =
      _$LoadApodEventCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class _$LoadApodEventCopyWithImpl<$Res> extends _$ApodEventCopyWithImpl<$Res>
    implements $LoadApodEventCopyWith<$Res> {
  _$LoadApodEventCopyWithImpl(
      LoadApodEvent _value, $Res Function(LoadApodEvent) _then)
      : super(_value, (v) => _then(v as LoadApodEvent));

  @override
  LoadApodEvent get _value => super._value as LoadApodEvent;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(LoadApodEvent(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$LoadApodEvent implements LoadApodEvent {
  const _$LoadApodEvent({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'ApodEvent.loadApod(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadApodEvent &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  $LoadApodEventCopyWith<LoadApodEvent> get copyWith =>
      _$LoadApodEventCopyWithImpl<LoadApodEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) loadApod,
    required TResult Function() loadRandomApod,
  }) {
    return loadApod(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? loadApod,
    TResult Function()? loadRandomApod,
  }) {
    return loadApod?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? loadApod,
    TResult Function()? loadRandomApod,
    required TResult orElse(),
  }) {
    if (loadApod != null) {
      return loadApod(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApodEvent value) loadApod,
    required TResult Function(LoadRandomApodEvent value) loadRandomApod,
  }) {
    return loadApod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadApodEvent value)? loadApod,
    TResult Function(LoadRandomApodEvent value)? loadRandomApod,
  }) {
    return loadApod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApodEvent value)? loadApod,
    TResult Function(LoadRandomApodEvent value)? loadRandomApod,
    required TResult orElse(),
  }) {
    if (loadApod != null) {
      return loadApod(this);
    }
    return orElse();
  }
}

abstract class LoadApodEvent implements ApodEvent {
  const factory LoadApodEvent({required DateTime date}) = _$LoadApodEvent;

  DateTime get date;
  @JsonKey(ignore: true)
  $LoadApodEventCopyWith<LoadApodEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadRandomApodEventCopyWith<$Res> {
  factory $LoadRandomApodEventCopyWith(
          LoadRandomApodEvent value, $Res Function(LoadRandomApodEvent) then) =
      _$LoadRandomApodEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadRandomApodEventCopyWithImpl<$Res>
    extends _$ApodEventCopyWithImpl<$Res>
    implements $LoadRandomApodEventCopyWith<$Res> {
  _$LoadRandomApodEventCopyWithImpl(
      LoadRandomApodEvent _value, $Res Function(LoadRandomApodEvent) _then)
      : super(_value, (v) => _then(v as LoadRandomApodEvent));

  @override
  LoadRandomApodEvent get _value => super._value as LoadRandomApodEvent;
}

/// @nodoc

class _$LoadRandomApodEvent implements LoadRandomApodEvent {
  const _$LoadRandomApodEvent();

  @override
  String toString() {
    return 'ApodEvent.loadRandomApod()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadRandomApodEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) loadApod,
    required TResult Function() loadRandomApod,
  }) {
    return loadRandomApod();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? loadApod,
    TResult Function()? loadRandomApod,
  }) {
    return loadRandomApod?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? loadApod,
    TResult Function()? loadRandomApod,
    required TResult orElse(),
  }) {
    if (loadRandomApod != null) {
      return loadRandomApod();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadApodEvent value) loadApod,
    required TResult Function(LoadRandomApodEvent value) loadRandomApod,
  }) {
    return loadRandomApod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadApodEvent value)? loadApod,
    TResult Function(LoadRandomApodEvent value)? loadRandomApod,
  }) {
    return loadRandomApod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadApodEvent value)? loadApod,
    TResult Function(LoadRandomApodEvent value)? loadRandomApod,
    required TResult orElse(),
  }) {
    if (loadRandomApod != null) {
      return loadRandomApod(this);
    }
    return orElse();
  }
}

abstract class LoadRandomApodEvent implements ApodEvent {
  const factory LoadRandomApodEvent() = _$LoadRandomApodEvent;
}

/// @nodoc
class _$ApodStateTearOff {
  const _$ApodStateTearOff();

  InitialApodState initial() {
    return const InitialApodState();
  }

  LoadingApodState loading() {
    return const LoadingApodState();
  }

  LoadedApodState loaded({required ApodEntity apod}) {
    return LoadedApodState(
      apod: apod,
    );
  }

  FailureApodState failure({required String errorMessage}) {
    return FailureApodState(
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $ApodState = _$ApodStateTearOff();

/// @nodoc
mixin _$ApodState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApodEntity apod) loaded,
    required TResult Function(String errorMessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApodEntity apod)? loaded,
    TResult Function(String errorMessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApodEntity apod)? loaded,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialApodState value) initial,
    required TResult Function(LoadingApodState value) loading,
    required TResult Function(LoadedApodState value) loaded,
    required TResult Function(FailureApodState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialApodState value)? initial,
    TResult Function(LoadingApodState value)? loading,
    TResult Function(LoadedApodState value)? loaded,
    TResult Function(FailureApodState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialApodState value)? initial,
    TResult Function(LoadingApodState value)? loading,
    TResult Function(LoadedApodState value)? loaded,
    TResult Function(FailureApodState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApodStateCopyWith<$Res> {
  factory $ApodStateCopyWith(ApodState value, $Res Function(ApodState) then) =
      _$ApodStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApodStateCopyWithImpl<$Res> implements $ApodStateCopyWith<$Res> {
  _$ApodStateCopyWithImpl(this._value, this._then);

  final ApodState _value;
  // ignore: unused_field
  final $Res Function(ApodState) _then;
}

/// @nodoc
abstract class $InitialApodStateCopyWith<$Res> {
  factory $InitialApodStateCopyWith(
          InitialApodState value, $Res Function(InitialApodState) then) =
      _$InitialApodStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialApodStateCopyWithImpl<$Res> extends _$ApodStateCopyWithImpl<$Res>
    implements $InitialApodStateCopyWith<$Res> {
  _$InitialApodStateCopyWithImpl(
      InitialApodState _value, $Res Function(InitialApodState) _then)
      : super(_value, (v) => _then(v as InitialApodState));

  @override
  InitialApodState get _value => super._value as InitialApodState;
}

/// @nodoc

class _$InitialApodState implements InitialApodState {
  const _$InitialApodState();

  @override
  String toString() {
    return 'ApodState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialApodState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApodEntity apod) loaded,
    required TResult Function(String errorMessage) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApodEntity apod)? loaded,
    TResult Function(String errorMessage)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApodEntity apod)? loaded,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialApodState value) initial,
    required TResult Function(LoadingApodState value) loading,
    required TResult Function(LoadedApodState value) loaded,
    required TResult Function(FailureApodState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialApodState value)? initial,
    TResult Function(LoadingApodState value)? loading,
    TResult Function(LoadedApodState value)? loaded,
    TResult Function(FailureApodState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialApodState value)? initial,
    TResult Function(LoadingApodState value)? loading,
    TResult Function(LoadedApodState value)? loaded,
    TResult Function(FailureApodState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialApodState implements ApodState {
  const factory InitialApodState() = _$InitialApodState;
}

/// @nodoc
abstract class $LoadingApodStateCopyWith<$Res> {
  factory $LoadingApodStateCopyWith(
          LoadingApodState value, $Res Function(LoadingApodState) then) =
      _$LoadingApodStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingApodStateCopyWithImpl<$Res> extends _$ApodStateCopyWithImpl<$Res>
    implements $LoadingApodStateCopyWith<$Res> {
  _$LoadingApodStateCopyWithImpl(
      LoadingApodState _value, $Res Function(LoadingApodState) _then)
      : super(_value, (v) => _then(v as LoadingApodState));

  @override
  LoadingApodState get _value => super._value as LoadingApodState;
}

/// @nodoc

class _$LoadingApodState implements LoadingApodState {
  const _$LoadingApodState();

  @override
  String toString() {
    return 'ApodState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingApodState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApodEntity apod) loaded,
    required TResult Function(String errorMessage) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApodEntity apod)? loaded,
    TResult Function(String errorMessage)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApodEntity apod)? loaded,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialApodState value) initial,
    required TResult Function(LoadingApodState value) loading,
    required TResult Function(LoadedApodState value) loaded,
    required TResult Function(FailureApodState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialApodState value)? initial,
    TResult Function(LoadingApodState value)? loading,
    TResult Function(LoadedApodState value)? loaded,
    TResult Function(FailureApodState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialApodState value)? initial,
    TResult Function(LoadingApodState value)? loading,
    TResult Function(LoadedApodState value)? loaded,
    TResult Function(FailureApodState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingApodState implements ApodState {
  const factory LoadingApodState() = _$LoadingApodState;
}

/// @nodoc
abstract class $LoadedApodStateCopyWith<$Res> {
  factory $LoadedApodStateCopyWith(
          LoadedApodState value, $Res Function(LoadedApodState) then) =
      _$LoadedApodStateCopyWithImpl<$Res>;
  $Res call({ApodEntity apod});
}

/// @nodoc
class _$LoadedApodStateCopyWithImpl<$Res> extends _$ApodStateCopyWithImpl<$Res>
    implements $LoadedApodStateCopyWith<$Res> {
  _$LoadedApodStateCopyWithImpl(
      LoadedApodState _value, $Res Function(LoadedApodState) _then)
      : super(_value, (v) => _then(v as LoadedApodState));

  @override
  LoadedApodState get _value => super._value as LoadedApodState;

  @override
  $Res call({
    Object? apod = freezed,
  }) {
    return _then(LoadedApodState(
      apod: apod == freezed
          ? _value.apod
          : apod // ignore: cast_nullable_to_non_nullable
              as ApodEntity,
    ));
  }
}

/// @nodoc

class _$LoadedApodState implements LoadedApodState {
  const _$LoadedApodState({required this.apod});

  @override
  final ApodEntity apod;

  @override
  String toString() {
    return 'ApodState.loaded(apod: $apod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadedApodState &&
            const DeepCollectionEquality().equals(other.apod, apod));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(apod));

  @JsonKey(ignore: true)
  @override
  $LoadedApodStateCopyWith<LoadedApodState> get copyWith =>
      _$LoadedApodStateCopyWithImpl<LoadedApodState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApodEntity apod) loaded,
    required TResult Function(String errorMessage) failure,
  }) {
    return loaded(apod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApodEntity apod)? loaded,
    TResult Function(String errorMessage)? failure,
  }) {
    return loaded?.call(apod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApodEntity apod)? loaded,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(apod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialApodState value) initial,
    required TResult Function(LoadingApodState value) loading,
    required TResult Function(LoadedApodState value) loaded,
    required TResult Function(FailureApodState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialApodState value)? initial,
    TResult Function(LoadingApodState value)? loading,
    TResult Function(LoadedApodState value)? loaded,
    TResult Function(FailureApodState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialApodState value)? initial,
    TResult Function(LoadingApodState value)? loading,
    TResult Function(LoadedApodState value)? loaded,
    TResult Function(FailureApodState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedApodState implements ApodState {
  const factory LoadedApodState({required ApodEntity apod}) = _$LoadedApodState;

  ApodEntity get apod;
  @JsonKey(ignore: true)
  $LoadedApodStateCopyWith<LoadedApodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureApodStateCopyWith<$Res> {
  factory $FailureApodStateCopyWith(
          FailureApodState value, $Res Function(FailureApodState) then) =
      _$FailureApodStateCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$FailureApodStateCopyWithImpl<$Res> extends _$ApodStateCopyWithImpl<$Res>
    implements $FailureApodStateCopyWith<$Res> {
  _$FailureApodStateCopyWithImpl(
      FailureApodState _value, $Res Function(FailureApodState) _then)
      : super(_value, (v) => _then(v as FailureApodState));

  @override
  FailureApodState get _value => super._value as FailureApodState;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(FailureApodState(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureApodState implements FailureApodState {
  const _$FailureApodState({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ApodState.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FailureApodState &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  $FailureApodStateCopyWith<FailureApodState> get copyWith =>
      _$FailureApodStateCopyWithImpl<FailureApodState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApodEntity apod) loaded,
    required TResult Function(String errorMessage) failure,
  }) {
    return failure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApodEntity apod)? loaded,
    TResult Function(String errorMessage)? failure,
  }) {
    return failure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApodEntity apod)? loaded,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialApodState value) initial,
    required TResult Function(LoadingApodState value) loading,
    required TResult Function(LoadedApodState value) loaded,
    required TResult Function(FailureApodState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialApodState value)? initial,
    TResult Function(LoadingApodState value)? loading,
    TResult Function(LoadedApodState value)? loaded,
    TResult Function(FailureApodState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialApodState value)? initial,
    TResult Function(LoadingApodState value)? loading,
    TResult Function(LoadedApodState value)? loaded,
    TResult Function(FailureApodState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureApodState implements ApodState {
  const factory FailureApodState({required String errorMessage}) =
      _$FailureApodState;

  String get errorMessage;
  @JsonKey(ignore: true)
  $FailureApodStateCopyWith<FailureApodState> get copyWith =>
      throw _privateConstructorUsedError;
}
