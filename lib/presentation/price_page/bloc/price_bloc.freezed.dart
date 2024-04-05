// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPrice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPrice value) getPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPrice value)? getPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPrice value)? getPrice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceEventCopyWith<$Res> {
  factory $PriceEventCopyWith(
          PriceEvent value, $Res Function(PriceEvent) then) =
      _$PriceEventCopyWithImpl<$Res, PriceEvent>;
}

/// @nodoc
class _$PriceEventCopyWithImpl<$Res, $Val extends PriceEvent>
    implements $PriceEventCopyWith<$Res> {
  _$PriceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetPriceImplCopyWith<$Res> {
  factory _$$GetPriceImplCopyWith(
          _$GetPriceImpl value, $Res Function(_$GetPriceImpl) then) =
      __$$GetPriceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPriceImplCopyWithImpl<$Res>
    extends _$PriceEventCopyWithImpl<$Res, _$GetPriceImpl>
    implements _$$GetPriceImplCopyWith<$Res> {
  __$$GetPriceImplCopyWithImpl(
      _$GetPriceImpl _value, $Res Function(_$GetPriceImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPriceImpl implements _GetPrice {
  const _$GetPriceImpl();

  @override
  String toString() {
    return 'PriceEvent.getPrice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPriceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPrice,
  }) {
    return getPrice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPrice,
  }) {
    return getPrice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPrice,
    required TResult orElse(),
  }) {
    if (getPrice != null) {
      return getPrice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPrice value) getPrice,
  }) {
    return getPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPrice value)? getPrice,
  }) {
    return getPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPrice value)? getPrice,
    required TResult orElse(),
  }) {
    if (getPrice != null) {
      return getPrice(this);
    }
    return orElse();
  }
}

abstract class _GetPrice implements PriceEvent {
  const factory _GetPrice() = _$GetPriceImpl;
}

/// @nodoc
mixin _$PriceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logout,
    required TResult Function(dynamic e) error,
    required TResult Function(List<Map<String, dynamic>> prices) prices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(dynamic e)? error,
    TResult? Function(List<Map<String, dynamic>> prices)? prices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(dynamic e)? error,
    TResult Function(List<Map<String, dynamic>> prices)? prices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_Prices value) prices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_Prices value)? prices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_Prices value)? prices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceStateCopyWith<$Res> {
  factory $PriceStateCopyWith(
          PriceState value, $Res Function(PriceState) then) =
      _$PriceStateCopyWithImpl<$Res, PriceState>;
}

/// @nodoc
class _$PriceStateCopyWithImpl<$Res, $Val extends PriceState>
    implements $PriceStateCopyWith<$Res> {
  _$PriceStateCopyWithImpl(this._value, this._then);

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
    extends _$PriceStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'PriceState.initial()';
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
    required TResult Function() logout,
    required TResult Function(dynamic e) error,
    required TResult Function(List<Map<String, dynamic>> prices) prices,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(dynamic e)? error,
    TResult? Function(List<Map<String, dynamic>> prices)? prices,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(dynamic e)? error,
    TResult Function(List<Map<String, dynamic>> prices)? prices,
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
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_Prices value) prices,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_Prices value)? prices,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_Prices value)? prices,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PriceState {
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
    extends _$PriceStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'PriceState.loading()';
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
    required TResult Function() logout,
    required TResult Function(dynamic e) error,
    required TResult Function(List<Map<String, dynamic>> prices) prices,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(dynamic e)? error,
    TResult? Function(List<Map<String, dynamic>> prices)? prices,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(dynamic e)? error,
    TResult Function(List<Map<String, dynamic>> prices)? prices,
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
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_Prices value) prices,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_Prices value)? prices,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_Prices value)? prices,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PriceState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$PriceStateCopyWithImpl<$Res, _$LogoutImpl>
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
    return 'PriceState.logout()';
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
    required TResult Function() logout,
    required TResult Function(dynamic e) error,
    required TResult Function(List<Map<String, dynamic>> prices) prices,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(dynamic e)? error,
    TResult? Function(List<Map<String, dynamic>> prices)? prices,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(dynamic e)? error,
    TResult Function(List<Map<String, dynamic>> prices)? prices,
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
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_Prices value) prices,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_Prices value)? prices,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_Prices value)? prices,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements PriceState {
  const factory _Logout() = _$LogoutImpl;
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
    extends _$PriceStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'PriceState.error(e: $e)';
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
    required TResult Function() logout,
    required TResult Function(dynamic e) error,
    required TResult Function(List<Map<String, dynamic>> prices) prices,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(dynamic e)? error,
    TResult? Function(List<Map<String, dynamic>> prices)? prices,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(dynamic e)? error,
    TResult Function(List<Map<String, dynamic>> prices)? prices,
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
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_Prices value) prices,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_Prices value)? prices,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_Prices value)? prices,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PriceState {
  const factory _Error(final dynamic e) = _$ErrorImpl;

  dynamic get e;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PricesImplCopyWith<$Res> {
  factory _$$PricesImplCopyWith(
          _$PricesImpl value, $Res Function(_$PricesImpl) then) =
      __$$PricesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> prices});
}

/// @nodoc
class __$$PricesImplCopyWithImpl<$Res>
    extends _$PriceStateCopyWithImpl<$Res, _$PricesImpl>
    implements _$$PricesImplCopyWith<$Res> {
  __$$PricesImplCopyWithImpl(
      _$PricesImpl _value, $Res Function(_$PricesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prices = null,
  }) {
    return _then(_$PricesImpl(
      null == prices
          ? _value._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$PricesImpl implements _Prices {
  const _$PricesImpl(final List<Map<String, dynamic>> prices)
      : _prices = prices;

  final List<Map<String, dynamic>> _prices;
  @override
  List<Map<String, dynamic>> get prices {
    if (_prices is EqualUnmodifiableListView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prices);
  }

  @override
  String toString() {
    return 'PriceState.prices(prices: $prices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricesImpl &&
            const DeepCollectionEquality().equals(other._prices, _prices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_prices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PricesImplCopyWith<_$PricesImpl> get copyWith =>
      __$$PricesImplCopyWithImpl<_$PricesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logout,
    required TResult Function(dynamic e) error,
    required TResult Function(List<Map<String, dynamic>> prices) prices,
  }) {
    return prices(this.prices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(dynamic e)? error,
    TResult? Function(List<Map<String, dynamic>> prices)? prices,
  }) {
    return prices?.call(this.prices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(dynamic e)? error,
    TResult Function(List<Map<String, dynamic>> prices)? prices,
    required TResult orElse(),
  }) {
    if (prices != null) {
      return prices(this.prices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_Prices value) prices,
  }) {
    return prices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_Prices value)? prices,
  }) {
    return prices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_Prices value)? prices,
    required TResult orElse(),
  }) {
    if (prices != null) {
      return prices(this);
    }
    return orElse();
  }
}

abstract class _Prices implements PriceState {
  const factory _Prices(final List<Map<String, dynamic>> prices) = _$PricesImpl;

  List<Map<String, dynamic>> get prices;
  @JsonKey(ignore: true)
  _$$PricesImplCopyWith<_$PricesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
