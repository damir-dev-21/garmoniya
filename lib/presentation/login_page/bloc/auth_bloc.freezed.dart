// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function() sync,
    required TResult Function(Map<String, dynamic> data) login,
    required TResult Function(Map<String, dynamic> data) logout,
    required TResult Function() logoutLocal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function()? sync,
    TResult? Function(Map<String, dynamic> data)? login,
    TResult? Function(Map<String, dynamic> data)? logout,
    TResult? Function()? logoutLocal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function()? sync,
    TResult Function(Map<String, dynamic> data)? login,
    TResult Function(Map<String, dynamic> data)? logout,
    TResult Function()? logoutLocal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Sync value) sync,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LogoutLocal value) logoutLocal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Sync value)? sync,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LogoutLocal value)? logoutLocal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Sync value)? sync,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_LogoutLocal value)? logoutLocal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckAuthImplCopyWith<$Res> {
  factory _$$CheckAuthImplCopyWith(
          _$CheckAuthImpl value, $Res Function(_$CheckAuthImpl) then) =
      __$$CheckAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthImpl>
    implements _$$CheckAuthImplCopyWith<$Res> {
  __$$CheckAuthImplCopyWithImpl(
      _$CheckAuthImpl _value, $Res Function(_$CheckAuthImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckAuthImpl implements _CheckAuth {
  const _$CheckAuthImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function() sync,
    required TResult Function(Map<String, dynamic> data) login,
    required TResult Function(Map<String, dynamic> data) logout,
    required TResult Function() logoutLocal,
  }) {
    return checkAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function()? sync,
    TResult? Function(Map<String, dynamic> data)? login,
    TResult? Function(Map<String, dynamic> data)? logout,
    TResult? Function()? logoutLocal,
  }) {
    return checkAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function()? sync,
    TResult Function(Map<String, dynamic> data)? login,
    TResult Function(Map<String, dynamic> data)? logout,
    TResult Function()? logoutLocal,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Sync value) sync,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LogoutLocal value) logoutLocal,
  }) {
    return checkAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Sync value)? sync,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LogoutLocal value)? logoutLocal,
  }) {
    return checkAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Sync value)? sync,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_LogoutLocal value)? logoutLocal,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth(this);
    }
    return orElse();
  }
}

abstract class _CheckAuth implements AuthEvent {
  const factory _CheckAuth() = _$CheckAuthImpl;
}

/// @nodoc
abstract class _$$SyncImplCopyWith<$Res> {
  factory _$$SyncImplCopyWith(
          _$SyncImpl value, $Res Function(_$SyncImpl) then) =
      __$$SyncImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SyncImpl>
    implements _$$SyncImplCopyWith<$Res> {
  __$$SyncImplCopyWithImpl(_$SyncImpl _value, $Res Function(_$SyncImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncImpl implements _Sync {
  const _$SyncImpl();

  @override
  String toString() {
    return 'AuthEvent.sync()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function() sync,
    required TResult Function(Map<String, dynamic> data) login,
    required TResult Function(Map<String, dynamic> data) logout,
    required TResult Function() logoutLocal,
  }) {
    return sync();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function()? sync,
    TResult? Function(Map<String, dynamic> data)? login,
    TResult? Function(Map<String, dynamic> data)? logout,
    TResult? Function()? logoutLocal,
  }) {
    return sync?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function()? sync,
    TResult Function(Map<String, dynamic> data)? login,
    TResult Function(Map<String, dynamic> data)? logout,
    TResult Function()? logoutLocal,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Sync value) sync,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LogoutLocal value) logoutLocal,
  }) {
    return sync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Sync value)? sync,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LogoutLocal value)? logoutLocal,
  }) {
    return sync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Sync value)? sync,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_LogoutLocal value)? logoutLocal,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync(this);
    }
    return orElse();
  }
}

abstract class _Sync implements AuthEvent {
  const factory _Sync() = _$SyncImpl;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoginImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl({required final Map<String, dynamic> data}) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'AuthEvent.login(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function() sync,
    required TResult Function(Map<String, dynamic> data) login,
    required TResult Function(Map<String, dynamic> data) logout,
    required TResult Function() logoutLocal,
  }) {
    return login(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function()? sync,
    TResult? Function(Map<String, dynamic> data)? login,
    TResult? Function(Map<String, dynamic> data)? logout,
    TResult? Function()? logoutLocal,
  }) {
    return login?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function()? sync,
    TResult Function(Map<String, dynamic> data)? login,
    TResult Function(Map<String, dynamic> data)? logout,
    TResult Function()? logoutLocal,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Sync value) sync,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LogoutLocal value) logoutLocal,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Sync value)? sync,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LogoutLocal value)? logoutLocal,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Sync value)? sync,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_LogoutLocal value)? logoutLocal,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login({required final Map<String, dynamic> data}) =
      _$LoginImpl;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LogoutImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl({required final Map<String, dynamic> data}) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'AuthEvent.logout(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutImplCopyWith<_$LogoutImpl> get copyWith =>
      __$$LogoutImplCopyWithImpl<_$LogoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function() sync,
    required TResult Function(Map<String, dynamic> data) login,
    required TResult Function(Map<String, dynamic> data) logout,
    required TResult Function() logoutLocal,
  }) {
    return logout(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function()? sync,
    TResult? Function(Map<String, dynamic> data)? login,
    TResult? Function(Map<String, dynamic> data)? logout,
    TResult? Function()? logoutLocal,
  }) {
    return logout?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function()? sync,
    TResult Function(Map<String, dynamic> data)? login,
    TResult Function(Map<String, dynamic> data)? logout,
    TResult Function()? logoutLocal,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Sync value) sync,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LogoutLocal value) logoutLocal,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Sync value)? sync,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LogoutLocal value)? logoutLocal,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Sync value)? sync,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_LogoutLocal value)? logoutLocal,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout({required final Map<String, dynamic> data}) =
      _$LogoutImpl;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$LogoutImplCopyWith<_$LogoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutLocalImplCopyWith<$Res> {
  factory _$$LogoutLocalImplCopyWith(
          _$LogoutLocalImpl value, $Res Function(_$LogoutLocalImpl) then) =
      __$$LogoutLocalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutLocalImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutLocalImpl>
    implements _$$LogoutLocalImplCopyWith<$Res> {
  __$$LogoutLocalImplCopyWithImpl(
      _$LogoutLocalImpl _value, $Res Function(_$LogoutLocalImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutLocalImpl implements _LogoutLocal {
  const _$LogoutLocalImpl();

  @override
  String toString() {
    return 'AuthEvent.logoutLocal()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutLocalImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function() sync,
    required TResult Function(Map<String, dynamic> data) login,
    required TResult Function(Map<String, dynamic> data) logout,
    required TResult Function() logoutLocal,
  }) {
    return logoutLocal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function()? sync,
    TResult? Function(Map<String, dynamic> data)? login,
    TResult? Function(Map<String, dynamic> data)? logout,
    TResult? Function()? logoutLocal,
  }) {
    return logoutLocal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function()? sync,
    TResult Function(Map<String, dynamic> data)? login,
    TResult Function(Map<String, dynamic> data)? logout,
    TResult Function()? logoutLocal,
    required TResult orElse(),
  }) {
    if (logoutLocal != null) {
      return logoutLocal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Sync value) sync,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LogoutLocal value) logoutLocal,
  }) {
    return logoutLocal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Sync value)? sync,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LogoutLocal value)? logoutLocal,
  }) {
    return logoutLocal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Sync value)? sync,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_LogoutLocal value)? logoutLocal,
    required TResult orElse(),
  }) {
    if (logoutLocal != null) {
      return logoutLocal(this);
    }
    return orElse();
  }
}

abstract class _LogoutLocal implements AuthEvent {
  const factory _LogoutLocal() = _$LogoutLocalImpl;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String e) unauthorized,
    required TResult Function(User? user, List<Map<String, dynamic>> contacts)
        authorized,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String e)? unauthorized,
    TResult? Function(User? user, List<Map<String, dynamic>> contacts)?
        authorized,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String e)? unauthorized,
    TResult Function(User? user, List<Map<String, dynamic>> contacts)?
        authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'AuthState.loading()';
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
    required TResult Function() loading,
    required TResult Function(String e) unauthorized,
    required TResult Function(User? user, List<Map<String, dynamic>> contacts)
        authorized,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String e)? unauthorized,
    TResult? Function(User? user, List<Map<String, dynamic>> contacts)?
        authorized,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String e)? unauthorized,
    TResult Function(User? user, List<Map<String, dynamic>> contacts)?
        authorized,
    TResult Function(String message)? error,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String e});
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$UnauthorizedImpl(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedImpl implements _Unauthorized {
  const _$UnauthorizedImpl(this.e);

  @override
  final String e;

  @override
  String toString() {
    return 'AuthState.unauthorized(e: $e)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedImpl &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      __$$UnauthorizedImplCopyWithImpl<_$UnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String e) unauthorized,
    required TResult Function(User? user, List<Map<String, dynamic>> contacts)
        authorized,
    required TResult Function(String message) error,
  }) {
    return unauthorized(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String e)? unauthorized,
    TResult? Function(User? user, List<Map<String, dynamic>> contacts)?
        authorized,
    TResult? Function(String message)? error,
  }) {
    return unauthorized?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String e)? unauthorized,
    TResult Function(User? user, List<Map<String, dynamic>> contacts)?
        authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements AuthState {
  const factory _Unauthorized(final String e) = _$UnauthorizedImpl;

  String get e;
  @JsonKey(ignore: true)
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthorizedImplCopyWith<$Res> {
  factory _$$AuthorizedImplCopyWith(
          _$AuthorizedImpl value, $Res Function(_$AuthorizedImpl) then) =
      __$$AuthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user, List<Map<String, dynamic>> contacts});
}

/// @nodoc
class __$$AuthorizedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthorizedImpl>
    implements _$$AuthorizedImplCopyWith<$Res> {
  __$$AuthorizedImplCopyWithImpl(
      _$AuthorizedImpl _value, $Res Function(_$AuthorizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? contacts = null,
  }) {
    return _then(_$AuthorizedImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$AuthorizedImpl implements _Authorized {
  const _$AuthorizedImpl(this.user, final List<Map<String, dynamic>> contacts)
      : _contacts = contacts;

  @override
  final User? user;
  final List<Map<String, dynamic>> _contacts;
  @override
  List<Map<String, dynamic>> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'AuthState.authorized(user: $user, contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizedImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizedImplCopyWith<_$AuthorizedImpl> get copyWith =>
      __$$AuthorizedImplCopyWithImpl<_$AuthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String e) unauthorized,
    required TResult Function(User? user, List<Map<String, dynamic>> contacts)
        authorized,
    required TResult Function(String message) error,
  }) {
    return authorized(user, contacts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String e)? unauthorized,
    TResult? Function(User? user, List<Map<String, dynamic>> contacts)?
        authorized,
    TResult? Function(String message)? error,
  }) {
    return authorized?.call(user, contacts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String e)? unauthorized,
    TResult Function(User? user, List<Map<String, dynamic>> contacts)?
        authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(user, contacts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _Authorized implements AuthState {
  const factory _Authorized(
          final User? user, final List<Map<String, dynamic>> contacts) =
      _$AuthorizedImpl;

  User? get user;
  List<Map<String, dynamic>> get contacts;
  @JsonKey(ignore: true)
  _$$AuthorizedImplCopyWith<_$AuthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String e) unauthorized,
    required TResult Function(User? user, List<Map<String, dynamic>> contacts)
        authorized,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String e)? unauthorized,
    TResult? Function(User? user, List<Map<String, dynamic>> contacts)?
        authorized,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String e)? unauthorized,
    TResult Function(User? user, List<Map<String, dynamic>> contacts)?
        authorized,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
