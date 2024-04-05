// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function() getAll,
    required TResult Function(String last_date) getNewsOffset,
    required TResult Function(String uuid) getNewsDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function()? getAll,
    TResult? Function(String last_date)? getNewsOffset,
    TResult? Function(String uuid)? getNewsDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function()? getAll,
    TResult Function(String last_date)? getNewsOffset,
    TResult Function(String uuid)? getNewsDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsEvent value) getNews,
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetNewsOffsetEvent value) getNewsOffset,
    required TResult Function(_GetNewsDetailEvent value) getNewsDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsEvent value)? getNews,
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetNewsOffsetEvent value)? getNewsOffset,
    TResult? Function(_GetNewsDetailEvent value)? getNewsDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsEvent value)? getNews,
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetNewsOffsetEvent value)? getNewsOffset,
    TResult Function(_GetNewsDetailEvent value)? getNewsDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEventCopyWith<$Res> {
  factory $NewsEventCopyWith(NewsEvent value, $Res Function(NewsEvent) then) =
      _$NewsEventCopyWithImpl<$Res, NewsEvent>;
}

/// @nodoc
class _$NewsEventCopyWithImpl<$Res, $Val extends NewsEvent>
    implements $NewsEventCopyWith<$Res> {
  _$NewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetNewsEventImplCopyWith<$Res> {
  factory _$$GetNewsEventImplCopyWith(
          _$GetNewsEventImpl value, $Res Function(_$GetNewsEventImpl) then) =
      __$$GetNewsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNewsEventImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$GetNewsEventImpl>
    implements _$$GetNewsEventImplCopyWith<$Res> {
  __$$GetNewsEventImplCopyWithImpl(
      _$GetNewsEventImpl _value, $Res Function(_$GetNewsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetNewsEventImpl implements _GetNewsEvent {
  const _$GetNewsEventImpl();

  @override
  String toString() {
    return 'NewsEvent.getNews()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetNewsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function() getAll,
    required TResult Function(String last_date) getNewsOffset,
    required TResult Function(String uuid) getNewsDetail,
  }) {
    return getNews();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function()? getAll,
    TResult? Function(String last_date)? getNewsOffset,
    TResult? Function(String uuid)? getNewsDetail,
  }) {
    return getNews?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function()? getAll,
    TResult Function(String last_date)? getNewsOffset,
    TResult Function(String uuid)? getNewsDetail,
    required TResult orElse(),
  }) {
    if (getNews != null) {
      return getNews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsEvent value) getNews,
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetNewsOffsetEvent value) getNewsOffset,
    required TResult Function(_GetNewsDetailEvent value) getNewsDetail,
  }) {
    return getNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsEvent value)? getNews,
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetNewsOffsetEvent value)? getNewsOffset,
    TResult? Function(_GetNewsDetailEvent value)? getNewsDetail,
  }) {
    return getNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsEvent value)? getNews,
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetNewsOffsetEvent value)? getNewsOffset,
    TResult Function(_GetNewsDetailEvent value)? getNewsDetail,
    required TResult orElse(),
  }) {
    if (getNews != null) {
      return getNews(this);
    }
    return orElse();
  }
}

abstract class _GetNewsEvent implements NewsEvent {
  const factory _GetNewsEvent() = _$GetNewsEventImpl;
}

/// @nodoc
abstract class _$$GetAllEventImplCopyWith<$Res> {
  factory _$$GetAllEventImplCopyWith(
          _$GetAllEventImpl value, $Res Function(_$GetAllEventImpl) then) =
      __$$GetAllEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllEventImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$GetAllEventImpl>
    implements _$$GetAllEventImplCopyWith<$Res> {
  __$$GetAllEventImplCopyWithImpl(
      _$GetAllEventImpl _value, $Res Function(_$GetAllEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllEventImpl implements _GetAllEvent {
  const _$GetAllEventImpl();

  @override
  String toString() {
    return 'NewsEvent.getAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function() getAll,
    required TResult Function(String last_date) getNewsOffset,
    required TResult Function(String uuid) getNewsDetail,
  }) {
    return getAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function()? getAll,
    TResult? Function(String last_date)? getNewsOffset,
    TResult? Function(String uuid)? getNewsDetail,
  }) {
    return getAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function()? getAll,
    TResult Function(String last_date)? getNewsOffset,
    TResult Function(String uuid)? getNewsDetail,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsEvent value) getNews,
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetNewsOffsetEvent value) getNewsOffset,
    required TResult Function(_GetNewsDetailEvent value) getNewsDetail,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsEvent value)? getNews,
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetNewsOffsetEvent value)? getNewsOffset,
    TResult? Function(_GetNewsDetailEvent value)? getNewsDetail,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsEvent value)? getNews,
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetNewsOffsetEvent value)? getNewsOffset,
    TResult Function(_GetNewsDetailEvent value)? getNewsDetail,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class _GetAllEvent implements NewsEvent {
  const factory _GetAllEvent() = _$GetAllEventImpl;
}

/// @nodoc
abstract class _$$GetNewsOffsetEventImplCopyWith<$Res> {
  factory _$$GetNewsOffsetEventImplCopyWith(_$GetNewsOffsetEventImpl value,
          $Res Function(_$GetNewsOffsetEventImpl) then) =
      __$$GetNewsOffsetEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String last_date});
}

/// @nodoc
class __$$GetNewsOffsetEventImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$GetNewsOffsetEventImpl>
    implements _$$GetNewsOffsetEventImplCopyWith<$Res> {
  __$$GetNewsOffsetEventImplCopyWithImpl(_$GetNewsOffsetEventImpl _value,
      $Res Function(_$GetNewsOffsetEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? last_date = null,
  }) {
    return _then(_$GetNewsOffsetEventImpl(
      null == last_date
          ? _value.last_date
          : last_date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetNewsOffsetEventImpl implements _GetNewsOffsetEvent {
  const _$GetNewsOffsetEventImpl(this.last_date);

  @override
  final String last_date;

  @override
  String toString() {
    return 'NewsEvent.getNewsOffset(last_date: $last_date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNewsOffsetEventImpl &&
            (identical(other.last_date, last_date) ||
                other.last_date == last_date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, last_date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNewsOffsetEventImplCopyWith<_$GetNewsOffsetEventImpl> get copyWith =>
      __$$GetNewsOffsetEventImplCopyWithImpl<_$GetNewsOffsetEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function() getAll,
    required TResult Function(String last_date) getNewsOffset,
    required TResult Function(String uuid) getNewsDetail,
  }) {
    return getNewsOffset(last_date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function()? getAll,
    TResult? Function(String last_date)? getNewsOffset,
    TResult? Function(String uuid)? getNewsDetail,
  }) {
    return getNewsOffset?.call(last_date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function()? getAll,
    TResult Function(String last_date)? getNewsOffset,
    TResult Function(String uuid)? getNewsDetail,
    required TResult orElse(),
  }) {
    if (getNewsOffset != null) {
      return getNewsOffset(last_date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsEvent value) getNews,
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetNewsOffsetEvent value) getNewsOffset,
    required TResult Function(_GetNewsDetailEvent value) getNewsDetail,
  }) {
    return getNewsOffset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsEvent value)? getNews,
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetNewsOffsetEvent value)? getNewsOffset,
    TResult? Function(_GetNewsDetailEvent value)? getNewsDetail,
  }) {
    return getNewsOffset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsEvent value)? getNews,
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetNewsOffsetEvent value)? getNewsOffset,
    TResult Function(_GetNewsDetailEvent value)? getNewsDetail,
    required TResult orElse(),
  }) {
    if (getNewsOffset != null) {
      return getNewsOffset(this);
    }
    return orElse();
  }
}

abstract class _GetNewsOffsetEvent implements NewsEvent {
  const factory _GetNewsOffsetEvent(final String last_date) =
      _$GetNewsOffsetEventImpl;

  String get last_date;
  @JsonKey(ignore: true)
  _$$GetNewsOffsetEventImplCopyWith<_$GetNewsOffsetEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetNewsDetailEventImplCopyWith<$Res> {
  factory _$$GetNewsDetailEventImplCopyWith(_$GetNewsDetailEventImpl value,
          $Res Function(_$GetNewsDetailEventImpl) then) =
      __$$GetNewsDetailEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$GetNewsDetailEventImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$GetNewsDetailEventImpl>
    implements _$$GetNewsDetailEventImplCopyWith<$Res> {
  __$$GetNewsDetailEventImplCopyWithImpl(_$GetNewsDetailEventImpl _value,
      $Res Function(_$GetNewsDetailEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$GetNewsDetailEventImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetNewsDetailEventImpl implements _GetNewsDetailEvent {
  const _$GetNewsDetailEventImpl(this.uuid);

  @override
  final String uuid;

  @override
  String toString() {
    return 'NewsEvent.getNewsDetail(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNewsDetailEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNewsDetailEventImplCopyWith<_$GetNewsDetailEventImpl> get copyWith =>
      __$$GetNewsDetailEventImplCopyWithImpl<_$GetNewsDetailEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function() getAll,
    required TResult Function(String last_date) getNewsOffset,
    required TResult Function(String uuid) getNewsDetail,
  }) {
    return getNewsDetail(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function()? getAll,
    TResult? Function(String last_date)? getNewsOffset,
    TResult? Function(String uuid)? getNewsDetail,
  }) {
    return getNewsDetail?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function()? getAll,
    TResult Function(String last_date)? getNewsOffset,
    TResult Function(String uuid)? getNewsDetail,
    required TResult orElse(),
  }) {
    if (getNewsDetail != null) {
      return getNewsDetail(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsEvent value) getNews,
    required TResult Function(_GetAllEvent value) getAll,
    required TResult Function(_GetNewsOffsetEvent value) getNewsOffset,
    required TResult Function(_GetNewsDetailEvent value) getNewsDetail,
  }) {
    return getNewsDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsEvent value)? getNews,
    TResult? Function(_GetAllEvent value)? getAll,
    TResult? Function(_GetNewsOffsetEvent value)? getNewsOffset,
    TResult? Function(_GetNewsDetailEvent value)? getNewsDetail,
  }) {
    return getNewsDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsEvent value)? getNews,
    TResult Function(_GetAllEvent value)? getAll,
    TResult Function(_GetNewsOffsetEvent value)? getNewsOffset,
    TResult Function(_GetNewsDetailEvent value)? getNewsDetail,
    required TResult orElse(),
  }) {
    if (getNewsDetail != null) {
      return getNewsDetail(this);
    }
    return orElse();
  }
}

abstract class _GetNewsDetailEvent implements NewsEvent {
  const factory _GetNewsDetailEvent(final String uuid) =
      _$GetNewsDetailEventImpl;

  String get uuid;
  @JsonKey(ignore: true)
  _$$GetNewsDetailEventImplCopyWith<_$GetNewsDetailEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() logout,
    required TResult Function(List<Map<String, dynamic>> news) news,
    required TResult Function(Map<String, dynamic> newDetail) newDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic e)? error,
    TResult? Function()? logout,
    TResult? Function(List<Map<String, dynamic>> news)? news,
    TResult? Function(Map<String, dynamic> newDetail)? newDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? logout,
    TResult Function(List<Map<String, dynamic>> news)? news,
    TResult Function(Map<String, dynamic> newDetail)? newDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Logout value) logout,
    required TResult Function(_News value) news,
    required TResult Function(_NewDetail value) newDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_News value)? news,
    TResult? Function(_NewDetail value)? newDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Logout value)? logout,
    TResult Function(_News value)? news,
    TResult Function(_NewDetail value)? newDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NewsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() logout,
    required TResult Function(List<Map<String, dynamic>> news) news,
    required TResult Function(Map<String, dynamic> newDetail) newDetail,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic e)? error,
    TResult? Function()? logout,
    TResult? Function(List<Map<String, dynamic>> news)? news,
    TResult? Function(Map<String, dynamic> newDetail)? newDetail,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? logout,
    TResult Function(List<Map<String, dynamic>> news)? news,
    TResult Function(Map<String, dynamic> newDetail)? newDetail,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Logout value) logout,
    required TResult Function(_News value) news,
    required TResult Function(_NewDetail value) newDetail,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_News value)? news,
    TResult? Function(_NewDetail value)? newDetail,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Logout value)? logout,
    TResult Function(_News value)? news,
    TResult Function(_NewDetail value)? newDetail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NewsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'NewsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() logout,
    required TResult Function(List<Map<String, dynamic>> news) news,
    required TResult Function(Map<String, dynamic> newDetail) newDetail,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic e)? error,
    TResult? Function()? logout,
    TResult? Function(List<Map<String, dynamic>> news)? news,
    TResult? Function(Map<String, dynamic> newDetail)? newDetail,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? logout,
    TResult Function(List<Map<String, dynamic>> news)? news,
    TResult Function(Map<String, dynamic> newDetail)? newDetail,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Logout value) logout,
    required TResult Function(_News value) news,
    required TResult Function(_NewDetail value) newDetail,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_News value)? news,
    TResult? Function(_NewDetail value)? newDetail,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Logout value)? logout,
    TResult Function(_News value)? news,
    TResult Function(_NewDetail value)? newDetail,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements NewsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic e});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$ErrorImpl(
      freezed == e ? _value.e! : e,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.e);

  @override
  final dynamic e;

  @override
  String toString() {
    return 'NewsState.error(e: $e)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() logout,
    required TResult Function(List<Map<String, dynamic>> news) news,
    required TResult Function(Map<String, dynamic> newDetail) newDetail,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic e)? error,
    TResult? Function()? logout,
    TResult? Function(List<Map<String, dynamic>> news)? news,
    TResult? Function(Map<String, dynamic> newDetail)? newDetail,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? logout,
    TResult Function(List<Map<String, dynamic>> news)? news,
    TResult Function(Map<String, dynamic> newDetail)? newDetail,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Logout value) logout,
    required TResult Function(_News value) news,
    required TResult Function(_NewDetail value) newDetail,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_News value)? news,
    TResult? Function(_NewDetail value)? newDetail,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Logout value)? logout,
    TResult Function(_News value)? news,
    TResult Function(_NewDetail value)? newDetail,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements NewsState {
  const factory _Error(final dynamic e) = _$ErrorImpl;

  dynamic get e;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'NewsState.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() logout,
    required TResult Function(List<Map<String, dynamic>> news) news,
    required TResult Function(Map<String, dynamic> newDetail) newDetail,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic e)? error,
    TResult? Function()? logout,
    TResult? Function(List<Map<String, dynamic>> news)? news,
    TResult? Function(Map<String, dynamic> newDetail)? newDetail,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? logout,
    TResult Function(List<Map<String, dynamic>> news)? news,
    TResult Function(Map<String, dynamic> newDetail)? newDetail,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Logout value) logout,
    required TResult Function(_News value) news,
    required TResult Function(_NewDetail value) newDetail,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_News value)? news,
    TResult? Function(_NewDetail value)? newDetail,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Logout value)? logout,
    TResult Function(_News value)? news,
    TResult Function(_NewDetail value)? newDetail,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements NewsState {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> news});
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_$NewsImpl(
      null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$NewsImpl implements _News {
  const _$NewsImpl(final List<Map<String, dynamic>> news) : _news = news;

  final List<Map<String, dynamic>> _news;
  @override
  List<Map<String, dynamic>> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  String toString() {
    return 'NewsState.news(news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_news));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() logout,
    required TResult Function(List<Map<String, dynamic>> news) news,
    required TResult Function(Map<String, dynamic> newDetail) newDetail,
  }) {
    return news(this.news);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic e)? error,
    TResult? Function()? logout,
    TResult? Function(List<Map<String, dynamic>> news)? news,
    TResult? Function(Map<String, dynamic> newDetail)? newDetail,
  }) {
    return news?.call(this.news);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? logout,
    TResult Function(List<Map<String, dynamic>> news)? news,
    TResult Function(Map<String, dynamic> newDetail)? newDetail,
    required TResult orElse(),
  }) {
    if (news != null) {
      return news(this.news);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Logout value) logout,
    required TResult Function(_News value) news,
    required TResult Function(_NewDetail value) newDetail,
  }) {
    return news(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_News value)? news,
    TResult? Function(_NewDetail value)? newDetail,
  }) {
    return news?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Logout value)? logout,
    TResult Function(_News value)? news,
    TResult Function(_NewDetail value)? newDetail,
    required TResult orElse(),
  }) {
    if (news != null) {
      return news(this);
    }
    return orElse();
  }
}

abstract class _News implements NewsState {
  const factory _News(final List<Map<String, dynamic>> news) = _$NewsImpl;

  List<Map<String, dynamic>> get news;
  @JsonKey(ignore: true)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewDetailImplCopyWith<$Res> {
  factory _$$NewDetailImplCopyWith(
          _$NewDetailImpl value, $Res Function(_$NewDetailImpl) then) =
      __$$NewDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> newDetail});
}

/// @nodoc
class __$$NewDetailImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewDetailImpl>
    implements _$$NewDetailImplCopyWith<$Res> {
  __$$NewDetailImplCopyWithImpl(
      _$NewDetailImpl _value, $Res Function(_$NewDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newDetail = null,
  }) {
    return _then(_$NewDetailImpl(
      null == newDetail
          ? _value._newDetail
          : newDetail // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$NewDetailImpl implements _NewDetail {
  const _$NewDetailImpl(final Map<String, dynamic> newDetail)
      : _newDetail = newDetail;

  final Map<String, dynamic> _newDetail;
  @override
  Map<String, dynamic> get newDetail {
    if (_newDetail is EqualUnmodifiableMapView) return _newDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_newDetail);
  }

  @override
  String toString() {
    return 'NewsState.newDetail(newDetail: $newDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewDetailImpl &&
            const DeepCollectionEquality()
                .equals(other._newDetail, _newDetail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_newDetail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewDetailImplCopyWith<_$NewDetailImpl> get copyWith =>
      __$$NewDetailImplCopyWithImpl<_$NewDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() logout,
    required TResult Function(List<Map<String, dynamic>> news) news,
    required TResult Function(Map<String, dynamic> newDetail) newDetail,
  }) {
    return newDetail(this.newDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic e)? error,
    TResult? Function()? logout,
    TResult? Function(List<Map<String, dynamic>> news)? news,
    TResult? Function(Map<String, dynamic> newDetail)? newDetail,
  }) {
    return newDetail?.call(this.newDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? logout,
    TResult Function(List<Map<String, dynamic>> news)? news,
    TResult Function(Map<String, dynamic> newDetail)? newDetail,
    required TResult orElse(),
  }) {
    if (newDetail != null) {
      return newDetail(this.newDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Logout value) logout,
    required TResult Function(_News value) news,
    required TResult Function(_NewDetail value) newDetail,
  }) {
    return newDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_News value)? news,
    TResult? Function(_NewDetail value)? newDetail,
  }) {
    return newDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Logout value)? logout,
    TResult Function(_News value)? news,
    TResult Function(_NewDetail value)? newDetail,
    required TResult orElse(),
  }) {
    if (newDetail != null) {
      return newDetail(this);
    }
    return orElse();
  }
}

abstract class _NewDetail implements NewsState {
  const factory _NewDetail(final Map<String, dynamic> newDetail) =
      _$NewDetailImpl;

  Map<String, dynamic> get newDetail;
  @JsonKey(ignore: true)
  _$$NewDetailImplCopyWith<_$NewDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
