// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportEvent {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? getData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetData value) getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetData value)? getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetData value)? getData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportEventCopyWith<ReportEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportEventCopyWith<$Res> {
  factory $ReportEventCopyWith(
          ReportEvent value, $Res Function(ReportEvent) then) =
      _$ReportEventCopyWithImpl<$Res, ReportEvent>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class _$ReportEventCopyWithImpl<$Res, $Val extends ReportEvent>
    implements $ReportEventCopyWith<$Res> {
  _$ReportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetDataImplCopyWith<$Res>
    implements $ReportEventCopyWith<$Res> {
  factory _$$GetDataImplCopyWith(
          _$GetDataImpl value, $Res Function(_$GetDataImpl) then) =
      __$$GetDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$GetDataImplCopyWithImpl<$Res>
    extends _$ReportEventCopyWithImpl<$Res, _$GetDataImpl>
    implements _$$GetDataImplCopyWith<$Res> {
  __$$GetDataImplCopyWithImpl(
      _$GetDataImpl _value, $Res Function(_$GetDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetDataImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$GetDataImpl implements _GetData {
  const _$GetDataImpl(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'ReportEvent.getData(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDataImplCopyWith<_$GetDataImpl> get copyWith =>
      __$$GetDataImplCopyWithImpl<_$GetDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) getData,
  }) {
    return getData(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? getData,
  }) {
    return getData?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? getData,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetData value) getData,
  }) {
    return getData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetData value)? getData,
  }) {
    return getData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetData value)? getData,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(this);
    }
    return orElse();
  }
}

abstract class _GetData implements ReportEvent {
  const factory _GetData(final Map<String, dynamic> data) = _$GetDataImpl;

  @override
  Map<String, dynamic> get data;
  @override
  @JsonKey(ignore: true)
  _$$GetDataImplCopyWith<_$GetDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() logout,
    required TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)
        report,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic e)? error,
    TResult? Function()? logout,
    TResult? Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? logout,
    TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Report value) report,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Report value)? report,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Logout value)? logout,
    TResult Function(_Report value)? report,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportStateCopyWith<$Res> {
  factory $ReportStateCopyWith(
          ReportState value, $Res Function(ReportState) then) =
      _$ReportStateCopyWithImpl<$Res, ReportState>;
}

/// @nodoc
class _$ReportStateCopyWithImpl<$Res, $Val extends ReportState>
    implements $ReportStateCopyWith<$Res> {
  _$ReportStateCopyWithImpl(this._value, this._then);

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
    extends _$ReportStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ReportState.initial()';
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
    required TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)
        report,
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
    TResult? Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
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
    TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
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
    required TResult Function(_Report value) report,
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
    TResult? Function(_Report value)? report,
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
    TResult Function(_Report value)? report,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReportState {
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
    extends _$ReportStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ReportState.loading()';
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
    required TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)
        report,
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
    TResult? Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
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
    TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
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
    required TResult Function(_Report value) report,
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
    TResult? Function(_Report value)? report,
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
    TResult Function(_Report value)? report,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ReportState {
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
    extends _$ReportStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'ReportState.error(e: $e)';
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
    required TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)
        report,
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
    TResult? Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
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
    TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
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
    required TResult Function(_Report value) report,
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
    TResult? Function(_Report value)? report,
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
    TResult Function(_Report value)? report,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ReportState {
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
    extends _$ReportStateCopyWithImpl<$Res, _$LogoutImpl>
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
    return 'ReportState.logout()';
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
    required TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)
        report,
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
    TResult? Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
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
    TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
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
    required TResult Function(_Report value) report,
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
    TResult? Function(_Report value)? report,
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
    TResult Function(_Report value)? report,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements ReportState {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$ReportImplCopyWith<$Res> {
  factory _$$ReportImplCopyWith(
          _$ReportImpl value, $Res Function(_$ReportImpl) then) =
      __$$ReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String initial_balance_dt,
      String initial_balance_ct,
      String final_balance_dt,
      String final_balance_ct,
      String turnover_dt,
      String turnover_ct,
      String base64,
      List<Map<String, dynamic>> turnover_results});
}

/// @nodoc
class __$$ReportImplCopyWithImpl<$Res>
    extends _$ReportStateCopyWithImpl<$Res, _$ReportImpl>
    implements _$$ReportImplCopyWith<$Res> {
  __$$ReportImplCopyWithImpl(
      _$ReportImpl _value, $Res Function(_$ReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initial_balance_dt = null,
    Object? initial_balance_ct = null,
    Object? final_balance_dt = null,
    Object? final_balance_ct = null,
    Object? turnover_dt = null,
    Object? turnover_ct = null,
    Object? base64 = null,
    Object? turnover_results = null,
  }) {
    return _then(_$ReportImpl(
      null == initial_balance_dt
          ? _value.initial_balance_dt
          : initial_balance_dt // ignore: cast_nullable_to_non_nullable
              as String,
      null == initial_balance_ct
          ? _value.initial_balance_ct
          : initial_balance_ct // ignore: cast_nullable_to_non_nullable
              as String,
      null == final_balance_dt
          ? _value.final_balance_dt
          : final_balance_dt // ignore: cast_nullable_to_non_nullable
              as String,
      null == final_balance_ct
          ? _value.final_balance_ct
          : final_balance_ct // ignore: cast_nullable_to_non_nullable
              as String,
      null == turnover_dt
          ? _value.turnover_dt
          : turnover_dt // ignore: cast_nullable_to_non_nullable
              as String,
      null == turnover_ct
          ? _value.turnover_ct
          : turnover_ct // ignore: cast_nullable_to_non_nullable
              as String,
      null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
      null == turnover_results
          ? _value._turnover_results
          : turnover_results // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ReportImpl implements _Report {
  const _$ReportImpl(
      this.initial_balance_dt,
      this.initial_balance_ct,
      this.final_balance_dt,
      this.final_balance_ct,
      this.turnover_dt,
      this.turnover_ct,
      this.base64,
      final List<Map<String, dynamic>> turnover_results)
      : _turnover_results = turnover_results;

  @override
  final String initial_balance_dt;
  @override
  final String initial_balance_ct;
  @override
  final String final_balance_dt;
  @override
  final String final_balance_ct;
  @override
  final String turnover_dt;
  @override
  final String turnover_ct;
  @override
  final String base64;
  final List<Map<String, dynamic>> _turnover_results;
  @override
  List<Map<String, dynamic>> get turnover_results {
    if (_turnover_results is EqualUnmodifiableListView)
      return _turnover_results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_turnover_results);
  }

  @override
  String toString() {
    return 'ReportState.report(initial_balance_dt: $initial_balance_dt, initial_balance_ct: $initial_balance_ct, final_balance_dt: $final_balance_dt, final_balance_ct: $final_balance_ct, turnover_dt: $turnover_dt, turnover_ct: $turnover_ct, base64: $base64, turnover_results: $turnover_results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportImpl &&
            (identical(other.initial_balance_dt, initial_balance_dt) ||
                other.initial_balance_dt == initial_balance_dt) &&
            (identical(other.initial_balance_ct, initial_balance_ct) ||
                other.initial_balance_ct == initial_balance_ct) &&
            (identical(other.final_balance_dt, final_balance_dt) ||
                other.final_balance_dt == final_balance_dt) &&
            (identical(other.final_balance_ct, final_balance_ct) ||
                other.final_balance_ct == final_balance_ct) &&
            (identical(other.turnover_dt, turnover_dt) ||
                other.turnover_dt == turnover_dt) &&
            (identical(other.turnover_ct, turnover_ct) ||
                other.turnover_ct == turnover_ct) &&
            (identical(other.base64, base64) || other.base64 == base64) &&
            const DeepCollectionEquality()
                .equals(other._turnover_results, _turnover_results));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      initial_balance_dt,
      initial_balance_ct,
      final_balance_dt,
      final_balance_ct,
      turnover_dt,
      turnover_ct,
      base64,
      const DeepCollectionEquality().hash(_turnover_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      __$$ReportImplCopyWithImpl<_$ReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic e) error,
    required TResult Function() logout,
    required TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)
        report,
  }) {
    return report(initial_balance_dt, initial_balance_ct, final_balance_dt,
        final_balance_ct, turnover_dt, turnover_ct, base64, turnover_results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic e)? error,
    TResult? Function()? logout,
    TResult? Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
  }) {
    return report?.call(
        initial_balance_dt,
        initial_balance_ct,
        final_balance_dt,
        final_balance_ct,
        turnover_dt,
        turnover_ct,
        base64,
        turnover_results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic e)? error,
    TResult Function()? logout,
    TResult Function(
            String initial_balance_dt,
            String initial_balance_ct,
            String final_balance_dt,
            String final_balance_ct,
            String turnover_dt,
            String turnover_ct,
            String base64,
            List<Map<String, dynamic>> turnover_results)?
        report,
    required TResult orElse(),
  }) {
    if (report != null) {
      return report(initial_balance_dt, initial_balance_ct, final_balance_dt,
          final_balance_ct, turnover_dt, turnover_ct, base64, turnover_results);
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
    required TResult Function(_Report value) report,
  }) {
    return report(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Report value)? report,
  }) {
    return report?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Logout value)? logout,
    TResult Function(_Report value)? report,
    required TResult orElse(),
  }) {
    if (report != null) {
      return report(this);
    }
    return orElse();
  }
}

abstract class _Report implements ReportState {
  const factory _Report(
      final String initial_balance_dt,
      final String initial_balance_ct,
      final String final_balance_dt,
      final String final_balance_ct,
      final String turnover_dt,
      final String turnover_ct,
      final String base64,
      final List<Map<String, dynamic>> turnover_results) = _$ReportImpl;

  String get initial_balance_dt;
  String get initial_balance_ct;
  String get final_balance_dt;
  String get final_balance_ct;
  String get turnover_dt;
  String get turnover_ct;
  String get base64;
  List<Map<String, dynamic>> get turnover_results;
  @JsonKey(ignore: true)
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
