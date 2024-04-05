// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrdersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrders,
    required TResult Function(String offset) getOrdersOffset,
    required TResult Function(String filter) getOrdersFilter,
    required TResult Function(String offset, String filter)
        getOrdersFilterOffset,
    required TResult Function(String uuidOrder) getOrder,
    required TResult Function(String uuid_order) rejectOrder,
    required TResult Function(String uuid_order, String sale_uuid) confirmOrder,
    required TResult Function(String uuid_order, String sale_uuid) acceptOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrders,
    TResult? Function(String offset)? getOrdersOffset,
    TResult? Function(String filter)? getOrdersFilter,
    TResult? Function(String offset, String filter)? getOrdersFilterOffset,
    TResult? Function(String uuidOrder)? getOrder,
    TResult? Function(String uuid_order)? rejectOrder,
    TResult? Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult? Function(String uuid_order, String sale_uuid)? acceptOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrders,
    TResult Function(String offset)? getOrdersOffset,
    TResult Function(String filter)? getOrdersFilter,
    TResult Function(String offset, String filter)? getOrdersFilterOffset,
    TResult Function(String uuidOrder)? getOrder,
    TResult Function(String uuid_order)? rejectOrder,
    TResult Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult Function(String uuid_order, String sale_uuid)? acceptOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrdersEvent value) getOrders,
    required TResult Function(_GetOrdersOffsetEvent value) getOrdersOffset,
    required TResult Function(_GetOrdersFilterEvent value) getOrdersFilter,
    required TResult Function(_GetOrdersFilterOffsetEvent value)
        getOrdersFilterOffset,
    required TResult Function(_GetOrderEvent value) getOrder,
    required TResult Function(_RejectOrder value) rejectOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_AcceptOrder value) acceptOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrdersEvent value)? getOrders,
    TResult? Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult? Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult? Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult? Function(_GetOrderEvent value)? getOrder,
    TResult? Function(_RejectOrder value)? rejectOrder,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_AcceptOrder value)? acceptOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrdersEvent value)? getOrders,
    TResult Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult Function(_GetOrderEvent value)? getOrder,
    TResult Function(_RejectOrder value)? rejectOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_AcceptOrder value)? acceptOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersEventCopyWith<$Res> {
  factory $OrdersEventCopyWith(
          OrdersEvent value, $Res Function(OrdersEvent) then) =
      _$OrdersEventCopyWithImpl<$Res, OrdersEvent>;
}

/// @nodoc
class _$OrdersEventCopyWithImpl<$Res, $Val extends OrdersEvent>
    implements $OrdersEventCopyWith<$Res> {
  _$OrdersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'OrdersEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrders,
    required TResult Function(String offset) getOrdersOffset,
    required TResult Function(String filter) getOrdersFilter,
    required TResult Function(String offset, String filter)
        getOrdersFilterOffset,
    required TResult Function(String uuidOrder) getOrder,
    required TResult Function(String uuid_order) rejectOrder,
    required TResult Function(String uuid_order, String sale_uuid) confirmOrder,
    required TResult Function(String uuid_order, String sale_uuid) acceptOrder,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrders,
    TResult? Function(String offset)? getOrdersOffset,
    TResult? Function(String filter)? getOrdersFilter,
    TResult? Function(String offset, String filter)? getOrdersFilterOffset,
    TResult? Function(String uuidOrder)? getOrder,
    TResult? Function(String uuid_order)? rejectOrder,
    TResult? Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult? Function(String uuid_order, String sale_uuid)? acceptOrder,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrders,
    TResult Function(String offset)? getOrdersOffset,
    TResult Function(String filter)? getOrdersFilter,
    TResult Function(String offset, String filter)? getOrdersFilterOffset,
    TResult Function(String uuidOrder)? getOrder,
    TResult Function(String uuid_order)? rejectOrder,
    TResult Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult Function(String uuid_order, String sale_uuid)? acceptOrder,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrdersEvent value) getOrders,
    required TResult Function(_GetOrdersOffsetEvent value) getOrdersOffset,
    required TResult Function(_GetOrdersFilterEvent value) getOrdersFilter,
    required TResult Function(_GetOrdersFilterOffsetEvent value)
        getOrdersFilterOffset,
    required TResult Function(_GetOrderEvent value) getOrder,
    required TResult Function(_RejectOrder value) rejectOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_AcceptOrder value) acceptOrder,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrdersEvent value)? getOrders,
    TResult? Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult? Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult? Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult? Function(_GetOrderEvent value)? getOrder,
    TResult? Function(_RejectOrder value)? rejectOrder,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_AcceptOrder value)? acceptOrder,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrdersEvent value)? getOrders,
    TResult Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult Function(_GetOrderEvent value)? getOrder,
    TResult Function(_RejectOrder value)? rejectOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_AcceptOrder value)? acceptOrder,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements OrdersEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetOrdersEventImplCopyWith<$Res> {
  factory _$$GetOrdersEventImplCopyWith(_$GetOrdersEventImpl value,
          $Res Function(_$GetOrdersEventImpl) then) =
      __$$GetOrdersEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetOrdersEventImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$GetOrdersEventImpl>
    implements _$$GetOrdersEventImplCopyWith<$Res> {
  __$$GetOrdersEventImplCopyWithImpl(
      _$GetOrdersEventImpl _value, $Res Function(_$GetOrdersEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetOrdersEventImpl implements _GetOrdersEvent {
  const _$GetOrdersEventImpl();

  @override
  String toString() {
    return 'OrdersEvent.getOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetOrdersEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrders,
    required TResult Function(String offset) getOrdersOffset,
    required TResult Function(String filter) getOrdersFilter,
    required TResult Function(String offset, String filter)
        getOrdersFilterOffset,
    required TResult Function(String uuidOrder) getOrder,
    required TResult Function(String uuid_order) rejectOrder,
    required TResult Function(String uuid_order, String sale_uuid) confirmOrder,
    required TResult Function(String uuid_order, String sale_uuid) acceptOrder,
  }) {
    return getOrders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrders,
    TResult? Function(String offset)? getOrdersOffset,
    TResult? Function(String filter)? getOrdersFilter,
    TResult? Function(String offset, String filter)? getOrdersFilterOffset,
    TResult? Function(String uuidOrder)? getOrder,
    TResult? Function(String uuid_order)? rejectOrder,
    TResult? Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult? Function(String uuid_order, String sale_uuid)? acceptOrder,
  }) {
    return getOrders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrders,
    TResult Function(String offset)? getOrdersOffset,
    TResult Function(String filter)? getOrdersFilter,
    TResult Function(String offset, String filter)? getOrdersFilterOffset,
    TResult Function(String uuidOrder)? getOrder,
    TResult Function(String uuid_order)? rejectOrder,
    TResult Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult Function(String uuid_order, String sale_uuid)? acceptOrder,
    required TResult orElse(),
  }) {
    if (getOrders != null) {
      return getOrders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrdersEvent value) getOrders,
    required TResult Function(_GetOrdersOffsetEvent value) getOrdersOffset,
    required TResult Function(_GetOrdersFilterEvent value) getOrdersFilter,
    required TResult Function(_GetOrdersFilterOffsetEvent value)
        getOrdersFilterOffset,
    required TResult Function(_GetOrderEvent value) getOrder,
    required TResult Function(_RejectOrder value) rejectOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_AcceptOrder value) acceptOrder,
  }) {
    return getOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrdersEvent value)? getOrders,
    TResult? Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult? Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult? Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult? Function(_GetOrderEvent value)? getOrder,
    TResult? Function(_RejectOrder value)? rejectOrder,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_AcceptOrder value)? acceptOrder,
  }) {
    return getOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrdersEvent value)? getOrders,
    TResult Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult Function(_GetOrderEvent value)? getOrder,
    TResult Function(_RejectOrder value)? rejectOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_AcceptOrder value)? acceptOrder,
    required TResult orElse(),
  }) {
    if (getOrders != null) {
      return getOrders(this);
    }
    return orElse();
  }
}

abstract class _GetOrdersEvent implements OrdersEvent {
  const factory _GetOrdersEvent() = _$GetOrdersEventImpl;
}

/// @nodoc
abstract class _$$GetOrdersOffsetEventImplCopyWith<$Res> {
  factory _$$GetOrdersOffsetEventImplCopyWith(_$GetOrdersOffsetEventImpl value,
          $Res Function(_$GetOrdersOffsetEventImpl) then) =
      __$$GetOrdersOffsetEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String offset});
}

/// @nodoc
class __$$GetOrdersOffsetEventImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$GetOrdersOffsetEventImpl>
    implements _$$GetOrdersOffsetEventImplCopyWith<$Res> {
  __$$GetOrdersOffsetEventImplCopyWithImpl(_$GetOrdersOffsetEventImpl _value,
      $Res Function(_$GetOrdersOffsetEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
  }) {
    return _then(_$GetOrdersOffsetEventImpl(
      null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetOrdersOffsetEventImpl implements _GetOrdersOffsetEvent {
  const _$GetOrdersOffsetEventImpl(this.offset);

  @override
  final String offset;

  @override
  String toString() {
    return 'OrdersEvent.getOrdersOffset(offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrdersOffsetEventImpl &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrdersOffsetEventImplCopyWith<_$GetOrdersOffsetEventImpl>
      get copyWith =>
          __$$GetOrdersOffsetEventImplCopyWithImpl<_$GetOrdersOffsetEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrders,
    required TResult Function(String offset) getOrdersOffset,
    required TResult Function(String filter) getOrdersFilter,
    required TResult Function(String offset, String filter)
        getOrdersFilterOffset,
    required TResult Function(String uuidOrder) getOrder,
    required TResult Function(String uuid_order) rejectOrder,
    required TResult Function(String uuid_order, String sale_uuid) confirmOrder,
    required TResult Function(String uuid_order, String sale_uuid) acceptOrder,
  }) {
    return getOrdersOffset(offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrders,
    TResult? Function(String offset)? getOrdersOffset,
    TResult? Function(String filter)? getOrdersFilter,
    TResult? Function(String offset, String filter)? getOrdersFilterOffset,
    TResult? Function(String uuidOrder)? getOrder,
    TResult? Function(String uuid_order)? rejectOrder,
    TResult? Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult? Function(String uuid_order, String sale_uuid)? acceptOrder,
  }) {
    return getOrdersOffset?.call(offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrders,
    TResult Function(String offset)? getOrdersOffset,
    TResult Function(String filter)? getOrdersFilter,
    TResult Function(String offset, String filter)? getOrdersFilterOffset,
    TResult Function(String uuidOrder)? getOrder,
    TResult Function(String uuid_order)? rejectOrder,
    TResult Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult Function(String uuid_order, String sale_uuid)? acceptOrder,
    required TResult orElse(),
  }) {
    if (getOrdersOffset != null) {
      return getOrdersOffset(offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrdersEvent value) getOrders,
    required TResult Function(_GetOrdersOffsetEvent value) getOrdersOffset,
    required TResult Function(_GetOrdersFilterEvent value) getOrdersFilter,
    required TResult Function(_GetOrdersFilterOffsetEvent value)
        getOrdersFilterOffset,
    required TResult Function(_GetOrderEvent value) getOrder,
    required TResult Function(_RejectOrder value) rejectOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_AcceptOrder value) acceptOrder,
  }) {
    return getOrdersOffset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrdersEvent value)? getOrders,
    TResult? Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult? Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult? Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult? Function(_GetOrderEvent value)? getOrder,
    TResult? Function(_RejectOrder value)? rejectOrder,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_AcceptOrder value)? acceptOrder,
  }) {
    return getOrdersOffset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrdersEvent value)? getOrders,
    TResult Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult Function(_GetOrderEvent value)? getOrder,
    TResult Function(_RejectOrder value)? rejectOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_AcceptOrder value)? acceptOrder,
    required TResult orElse(),
  }) {
    if (getOrdersOffset != null) {
      return getOrdersOffset(this);
    }
    return orElse();
  }
}

abstract class _GetOrdersOffsetEvent implements OrdersEvent {
  const factory _GetOrdersOffsetEvent(final String offset) =
      _$GetOrdersOffsetEventImpl;

  String get offset;
  @JsonKey(ignore: true)
  _$$GetOrdersOffsetEventImplCopyWith<_$GetOrdersOffsetEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOrdersFilterEventImplCopyWith<$Res> {
  factory _$$GetOrdersFilterEventImplCopyWith(_$GetOrdersFilterEventImpl value,
          $Res Function(_$GetOrdersFilterEventImpl) then) =
      __$$GetOrdersFilterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String filter});
}

/// @nodoc
class __$$GetOrdersFilterEventImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$GetOrdersFilterEventImpl>
    implements _$$GetOrdersFilterEventImplCopyWith<$Res> {
  __$$GetOrdersFilterEventImplCopyWithImpl(_$GetOrdersFilterEventImpl _value,
      $Res Function(_$GetOrdersFilterEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$GetOrdersFilterEventImpl(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetOrdersFilterEventImpl implements _GetOrdersFilterEvent {
  const _$GetOrdersFilterEventImpl(this.filter);

  @override
  final String filter;

  @override
  String toString() {
    return 'OrdersEvent.getOrdersFilter(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrdersFilterEventImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrdersFilterEventImplCopyWith<_$GetOrdersFilterEventImpl>
      get copyWith =>
          __$$GetOrdersFilterEventImplCopyWithImpl<_$GetOrdersFilterEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrders,
    required TResult Function(String offset) getOrdersOffset,
    required TResult Function(String filter) getOrdersFilter,
    required TResult Function(String offset, String filter)
        getOrdersFilterOffset,
    required TResult Function(String uuidOrder) getOrder,
    required TResult Function(String uuid_order) rejectOrder,
    required TResult Function(String uuid_order, String sale_uuid) confirmOrder,
    required TResult Function(String uuid_order, String sale_uuid) acceptOrder,
  }) {
    return getOrdersFilter(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrders,
    TResult? Function(String offset)? getOrdersOffset,
    TResult? Function(String filter)? getOrdersFilter,
    TResult? Function(String offset, String filter)? getOrdersFilterOffset,
    TResult? Function(String uuidOrder)? getOrder,
    TResult? Function(String uuid_order)? rejectOrder,
    TResult? Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult? Function(String uuid_order, String sale_uuid)? acceptOrder,
  }) {
    return getOrdersFilter?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrders,
    TResult Function(String offset)? getOrdersOffset,
    TResult Function(String filter)? getOrdersFilter,
    TResult Function(String offset, String filter)? getOrdersFilterOffset,
    TResult Function(String uuidOrder)? getOrder,
    TResult Function(String uuid_order)? rejectOrder,
    TResult Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult Function(String uuid_order, String sale_uuid)? acceptOrder,
    required TResult orElse(),
  }) {
    if (getOrdersFilter != null) {
      return getOrdersFilter(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrdersEvent value) getOrders,
    required TResult Function(_GetOrdersOffsetEvent value) getOrdersOffset,
    required TResult Function(_GetOrdersFilterEvent value) getOrdersFilter,
    required TResult Function(_GetOrdersFilterOffsetEvent value)
        getOrdersFilterOffset,
    required TResult Function(_GetOrderEvent value) getOrder,
    required TResult Function(_RejectOrder value) rejectOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_AcceptOrder value) acceptOrder,
  }) {
    return getOrdersFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrdersEvent value)? getOrders,
    TResult? Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult? Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult? Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult? Function(_GetOrderEvent value)? getOrder,
    TResult? Function(_RejectOrder value)? rejectOrder,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_AcceptOrder value)? acceptOrder,
  }) {
    return getOrdersFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrdersEvent value)? getOrders,
    TResult Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult Function(_GetOrderEvent value)? getOrder,
    TResult Function(_RejectOrder value)? rejectOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_AcceptOrder value)? acceptOrder,
    required TResult orElse(),
  }) {
    if (getOrdersFilter != null) {
      return getOrdersFilter(this);
    }
    return orElse();
  }
}

abstract class _GetOrdersFilterEvent implements OrdersEvent {
  const factory _GetOrdersFilterEvent(final String filter) =
      _$GetOrdersFilterEventImpl;

  String get filter;
  @JsonKey(ignore: true)
  _$$GetOrdersFilterEventImplCopyWith<_$GetOrdersFilterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOrdersFilterOffsetEventImplCopyWith<$Res> {
  factory _$$GetOrdersFilterOffsetEventImplCopyWith(
          _$GetOrdersFilterOffsetEventImpl value,
          $Res Function(_$GetOrdersFilterOffsetEventImpl) then) =
      __$$GetOrdersFilterOffsetEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String offset, String filter});
}

/// @nodoc
class __$$GetOrdersFilterOffsetEventImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$GetOrdersFilterOffsetEventImpl>
    implements _$$GetOrdersFilterOffsetEventImplCopyWith<$Res> {
  __$$GetOrdersFilterOffsetEventImplCopyWithImpl(
      _$GetOrdersFilterOffsetEventImpl _value,
      $Res Function(_$GetOrdersFilterOffsetEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? filter = null,
  }) {
    return _then(_$GetOrdersFilterOffsetEventImpl(
      null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as String,
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetOrdersFilterOffsetEventImpl implements _GetOrdersFilterOffsetEvent {
  const _$GetOrdersFilterOffsetEventImpl(this.offset, this.filter);

  @override
  final String offset;
  @override
  final String filter;

  @override
  String toString() {
    return 'OrdersEvent.getOrdersFilterOffset(offset: $offset, filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrdersFilterOffsetEventImpl &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, offset, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrdersFilterOffsetEventImplCopyWith<_$GetOrdersFilterOffsetEventImpl>
      get copyWith => __$$GetOrdersFilterOffsetEventImplCopyWithImpl<
          _$GetOrdersFilterOffsetEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrders,
    required TResult Function(String offset) getOrdersOffset,
    required TResult Function(String filter) getOrdersFilter,
    required TResult Function(String offset, String filter)
        getOrdersFilterOffset,
    required TResult Function(String uuidOrder) getOrder,
    required TResult Function(String uuid_order) rejectOrder,
    required TResult Function(String uuid_order, String sale_uuid) confirmOrder,
    required TResult Function(String uuid_order, String sale_uuid) acceptOrder,
  }) {
    return getOrdersFilterOffset(offset, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrders,
    TResult? Function(String offset)? getOrdersOffset,
    TResult? Function(String filter)? getOrdersFilter,
    TResult? Function(String offset, String filter)? getOrdersFilterOffset,
    TResult? Function(String uuidOrder)? getOrder,
    TResult? Function(String uuid_order)? rejectOrder,
    TResult? Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult? Function(String uuid_order, String sale_uuid)? acceptOrder,
  }) {
    return getOrdersFilterOffset?.call(offset, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrders,
    TResult Function(String offset)? getOrdersOffset,
    TResult Function(String filter)? getOrdersFilter,
    TResult Function(String offset, String filter)? getOrdersFilterOffset,
    TResult Function(String uuidOrder)? getOrder,
    TResult Function(String uuid_order)? rejectOrder,
    TResult Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult Function(String uuid_order, String sale_uuid)? acceptOrder,
    required TResult orElse(),
  }) {
    if (getOrdersFilterOffset != null) {
      return getOrdersFilterOffset(offset, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrdersEvent value) getOrders,
    required TResult Function(_GetOrdersOffsetEvent value) getOrdersOffset,
    required TResult Function(_GetOrdersFilterEvent value) getOrdersFilter,
    required TResult Function(_GetOrdersFilterOffsetEvent value)
        getOrdersFilterOffset,
    required TResult Function(_GetOrderEvent value) getOrder,
    required TResult Function(_RejectOrder value) rejectOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_AcceptOrder value) acceptOrder,
  }) {
    return getOrdersFilterOffset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrdersEvent value)? getOrders,
    TResult? Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult? Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult? Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult? Function(_GetOrderEvent value)? getOrder,
    TResult? Function(_RejectOrder value)? rejectOrder,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_AcceptOrder value)? acceptOrder,
  }) {
    return getOrdersFilterOffset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrdersEvent value)? getOrders,
    TResult Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult Function(_GetOrderEvent value)? getOrder,
    TResult Function(_RejectOrder value)? rejectOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_AcceptOrder value)? acceptOrder,
    required TResult orElse(),
  }) {
    if (getOrdersFilterOffset != null) {
      return getOrdersFilterOffset(this);
    }
    return orElse();
  }
}

abstract class _GetOrdersFilterOffsetEvent implements OrdersEvent {
  const factory _GetOrdersFilterOffsetEvent(
          final String offset, final String filter) =
      _$GetOrdersFilterOffsetEventImpl;

  String get offset;
  String get filter;
  @JsonKey(ignore: true)
  _$$GetOrdersFilterOffsetEventImplCopyWith<_$GetOrdersFilterOffsetEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOrderEventImplCopyWith<$Res> {
  factory _$$GetOrderEventImplCopyWith(
          _$GetOrderEventImpl value, $Res Function(_$GetOrderEventImpl) then) =
      __$$GetOrderEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuidOrder});
}

/// @nodoc
class __$$GetOrderEventImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$GetOrderEventImpl>
    implements _$$GetOrderEventImplCopyWith<$Res> {
  __$$GetOrderEventImplCopyWithImpl(
      _$GetOrderEventImpl _value, $Res Function(_$GetOrderEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuidOrder = null,
  }) {
    return _then(_$GetOrderEventImpl(
      null == uuidOrder
          ? _value.uuidOrder
          : uuidOrder // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetOrderEventImpl implements _GetOrderEvent {
  const _$GetOrderEventImpl(this.uuidOrder);

  @override
  final String uuidOrder;

  @override
  String toString() {
    return 'OrdersEvent.getOrder(uuidOrder: $uuidOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrderEventImpl &&
            (identical(other.uuidOrder, uuidOrder) ||
                other.uuidOrder == uuidOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuidOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrderEventImplCopyWith<_$GetOrderEventImpl> get copyWith =>
      __$$GetOrderEventImplCopyWithImpl<_$GetOrderEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrders,
    required TResult Function(String offset) getOrdersOffset,
    required TResult Function(String filter) getOrdersFilter,
    required TResult Function(String offset, String filter)
        getOrdersFilterOffset,
    required TResult Function(String uuidOrder) getOrder,
    required TResult Function(String uuid_order) rejectOrder,
    required TResult Function(String uuid_order, String sale_uuid) confirmOrder,
    required TResult Function(String uuid_order, String sale_uuid) acceptOrder,
  }) {
    return getOrder(uuidOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrders,
    TResult? Function(String offset)? getOrdersOffset,
    TResult? Function(String filter)? getOrdersFilter,
    TResult? Function(String offset, String filter)? getOrdersFilterOffset,
    TResult? Function(String uuidOrder)? getOrder,
    TResult? Function(String uuid_order)? rejectOrder,
    TResult? Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult? Function(String uuid_order, String sale_uuid)? acceptOrder,
  }) {
    return getOrder?.call(uuidOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrders,
    TResult Function(String offset)? getOrdersOffset,
    TResult Function(String filter)? getOrdersFilter,
    TResult Function(String offset, String filter)? getOrdersFilterOffset,
    TResult Function(String uuidOrder)? getOrder,
    TResult Function(String uuid_order)? rejectOrder,
    TResult Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult Function(String uuid_order, String sale_uuid)? acceptOrder,
    required TResult orElse(),
  }) {
    if (getOrder != null) {
      return getOrder(uuidOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrdersEvent value) getOrders,
    required TResult Function(_GetOrdersOffsetEvent value) getOrdersOffset,
    required TResult Function(_GetOrdersFilterEvent value) getOrdersFilter,
    required TResult Function(_GetOrdersFilterOffsetEvent value)
        getOrdersFilterOffset,
    required TResult Function(_GetOrderEvent value) getOrder,
    required TResult Function(_RejectOrder value) rejectOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_AcceptOrder value) acceptOrder,
  }) {
    return getOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrdersEvent value)? getOrders,
    TResult? Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult? Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult? Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult? Function(_GetOrderEvent value)? getOrder,
    TResult? Function(_RejectOrder value)? rejectOrder,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_AcceptOrder value)? acceptOrder,
  }) {
    return getOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrdersEvent value)? getOrders,
    TResult Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult Function(_GetOrderEvent value)? getOrder,
    TResult Function(_RejectOrder value)? rejectOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_AcceptOrder value)? acceptOrder,
    required TResult orElse(),
  }) {
    if (getOrder != null) {
      return getOrder(this);
    }
    return orElse();
  }
}

abstract class _GetOrderEvent implements OrdersEvent {
  const factory _GetOrderEvent(final String uuidOrder) = _$GetOrderEventImpl;

  String get uuidOrder;
  @JsonKey(ignore: true)
  _$$GetOrderEventImplCopyWith<_$GetOrderEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectOrderImplCopyWith<$Res> {
  factory _$$RejectOrderImplCopyWith(
          _$RejectOrderImpl value, $Res Function(_$RejectOrderImpl) then) =
      __$$RejectOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid_order});
}

/// @nodoc
class __$$RejectOrderImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$RejectOrderImpl>
    implements _$$RejectOrderImplCopyWith<$Res> {
  __$$RejectOrderImplCopyWithImpl(
      _$RejectOrderImpl _value, $Res Function(_$RejectOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid_order = null,
  }) {
    return _then(_$RejectOrderImpl(
      null == uuid_order
          ? _value.uuid_order
          : uuid_order // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectOrderImpl implements _RejectOrder {
  const _$RejectOrderImpl(this.uuid_order);

  @override
  final String uuid_order;

  @override
  String toString() {
    return 'OrdersEvent.rejectOrder(uuid_order: $uuid_order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectOrderImpl &&
            (identical(other.uuid_order, uuid_order) ||
                other.uuid_order == uuid_order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid_order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectOrderImplCopyWith<_$RejectOrderImpl> get copyWith =>
      __$$RejectOrderImplCopyWithImpl<_$RejectOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrders,
    required TResult Function(String offset) getOrdersOffset,
    required TResult Function(String filter) getOrdersFilter,
    required TResult Function(String offset, String filter)
        getOrdersFilterOffset,
    required TResult Function(String uuidOrder) getOrder,
    required TResult Function(String uuid_order) rejectOrder,
    required TResult Function(String uuid_order, String sale_uuid) confirmOrder,
    required TResult Function(String uuid_order, String sale_uuid) acceptOrder,
  }) {
    return rejectOrder(uuid_order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrders,
    TResult? Function(String offset)? getOrdersOffset,
    TResult? Function(String filter)? getOrdersFilter,
    TResult? Function(String offset, String filter)? getOrdersFilterOffset,
    TResult? Function(String uuidOrder)? getOrder,
    TResult? Function(String uuid_order)? rejectOrder,
    TResult? Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult? Function(String uuid_order, String sale_uuid)? acceptOrder,
  }) {
    return rejectOrder?.call(uuid_order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrders,
    TResult Function(String offset)? getOrdersOffset,
    TResult Function(String filter)? getOrdersFilter,
    TResult Function(String offset, String filter)? getOrdersFilterOffset,
    TResult Function(String uuidOrder)? getOrder,
    TResult Function(String uuid_order)? rejectOrder,
    TResult Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult Function(String uuid_order, String sale_uuid)? acceptOrder,
    required TResult orElse(),
  }) {
    if (rejectOrder != null) {
      return rejectOrder(uuid_order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrdersEvent value) getOrders,
    required TResult Function(_GetOrdersOffsetEvent value) getOrdersOffset,
    required TResult Function(_GetOrdersFilterEvent value) getOrdersFilter,
    required TResult Function(_GetOrdersFilterOffsetEvent value)
        getOrdersFilterOffset,
    required TResult Function(_GetOrderEvent value) getOrder,
    required TResult Function(_RejectOrder value) rejectOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_AcceptOrder value) acceptOrder,
  }) {
    return rejectOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrdersEvent value)? getOrders,
    TResult? Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult? Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult? Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult? Function(_GetOrderEvent value)? getOrder,
    TResult? Function(_RejectOrder value)? rejectOrder,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_AcceptOrder value)? acceptOrder,
  }) {
    return rejectOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrdersEvent value)? getOrders,
    TResult Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult Function(_GetOrderEvent value)? getOrder,
    TResult Function(_RejectOrder value)? rejectOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_AcceptOrder value)? acceptOrder,
    required TResult orElse(),
  }) {
    if (rejectOrder != null) {
      return rejectOrder(this);
    }
    return orElse();
  }
}

abstract class _RejectOrder implements OrdersEvent {
  const factory _RejectOrder(final String uuid_order) = _$RejectOrderImpl;

  String get uuid_order;
  @JsonKey(ignore: true)
  _$$RejectOrderImplCopyWith<_$RejectOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmOrderImplCopyWith<$Res> {
  factory _$$ConfirmOrderImplCopyWith(
          _$ConfirmOrderImpl value, $Res Function(_$ConfirmOrderImpl) then) =
      __$$ConfirmOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid_order, String sale_uuid});
}

/// @nodoc
class __$$ConfirmOrderImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$ConfirmOrderImpl>
    implements _$$ConfirmOrderImplCopyWith<$Res> {
  __$$ConfirmOrderImplCopyWithImpl(
      _$ConfirmOrderImpl _value, $Res Function(_$ConfirmOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid_order = null,
    Object? sale_uuid = null,
  }) {
    return _then(_$ConfirmOrderImpl(
      null == uuid_order
          ? _value.uuid_order
          : uuid_order // ignore: cast_nullable_to_non_nullable
              as String,
      null == sale_uuid
          ? _value.sale_uuid
          : sale_uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfirmOrderImpl implements _ConfirmOrder {
  const _$ConfirmOrderImpl(this.uuid_order, this.sale_uuid);

  @override
  final String uuid_order;
  @override
  final String sale_uuid;

  @override
  String toString() {
    return 'OrdersEvent.confirmOrder(uuid_order: $uuid_order, sale_uuid: $sale_uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmOrderImpl &&
            (identical(other.uuid_order, uuid_order) ||
                other.uuid_order == uuid_order) &&
            (identical(other.sale_uuid, sale_uuid) ||
                other.sale_uuid == sale_uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid_order, sale_uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmOrderImplCopyWith<_$ConfirmOrderImpl> get copyWith =>
      __$$ConfirmOrderImplCopyWithImpl<_$ConfirmOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrders,
    required TResult Function(String offset) getOrdersOffset,
    required TResult Function(String filter) getOrdersFilter,
    required TResult Function(String offset, String filter)
        getOrdersFilterOffset,
    required TResult Function(String uuidOrder) getOrder,
    required TResult Function(String uuid_order) rejectOrder,
    required TResult Function(String uuid_order, String sale_uuid) confirmOrder,
    required TResult Function(String uuid_order, String sale_uuid) acceptOrder,
  }) {
    return confirmOrder(uuid_order, sale_uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrders,
    TResult? Function(String offset)? getOrdersOffset,
    TResult? Function(String filter)? getOrdersFilter,
    TResult? Function(String offset, String filter)? getOrdersFilterOffset,
    TResult? Function(String uuidOrder)? getOrder,
    TResult? Function(String uuid_order)? rejectOrder,
    TResult? Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult? Function(String uuid_order, String sale_uuid)? acceptOrder,
  }) {
    return confirmOrder?.call(uuid_order, sale_uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrders,
    TResult Function(String offset)? getOrdersOffset,
    TResult Function(String filter)? getOrdersFilter,
    TResult Function(String offset, String filter)? getOrdersFilterOffset,
    TResult Function(String uuidOrder)? getOrder,
    TResult Function(String uuid_order)? rejectOrder,
    TResult Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult Function(String uuid_order, String sale_uuid)? acceptOrder,
    required TResult orElse(),
  }) {
    if (confirmOrder != null) {
      return confirmOrder(uuid_order, sale_uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrdersEvent value) getOrders,
    required TResult Function(_GetOrdersOffsetEvent value) getOrdersOffset,
    required TResult Function(_GetOrdersFilterEvent value) getOrdersFilter,
    required TResult Function(_GetOrdersFilterOffsetEvent value)
        getOrdersFilterOffset,
    required TResult Function(_GetOrderEvent value) getOrder,
    required TResult Function(_RejectOrder value) rejectOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_AcceptOrder value) acceptOrder,
  }) {
    return confirmOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrdersEvent value)? getOrders,
    TResult? Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult? Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult? Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult? Function(_GetOrderEvent value)? getOrder,
    TResult? Function(_RejectOrder value)? rejectOrder,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_AcceptOrder value)? acceptOrder,
  }) {
    return confirmOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrdersEvent value)? getOrders,
    TResult Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult Function(_GetOrderEvent value)? getOrder,
    TResult Function(_RejectOrder value)? rejectOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_AcceptOrder value)? acceptOrder,
    required TResult orElse(),
  }) {
    if (confirmOrder != null) {
      return confirmOrder(this);
    }
    return orElse();
  }
}

abstract class _ConfirmOrder implements OrdersEvent {
  const factory _ConfirmOrder(final String uuid_order, final String sale_uuid) =
      _$ConfirmOrderImpl;

  String get uuid_order;
  String get sale_uuid;
  @JsonKey(ignore: true)
  _$$ConfirmOrderImplCopyWith<_$ConfirmOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AcceptOrderImplCopyWith<$Res> {
  factory _$$AcceptOrderImplCopyWith(
          _$AcceptOrderImpl value, $Res Function(_$AcceptOrderImpl) then) =
      __$$AcceptOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid_order, String sale_uuid});
}

/// @nodoc
class __$$AcceptOrderImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$AcceptOrderImpl>
    implements _$$AcceptOrderImplCopyWith<$Res> {
  __$$AcceptOrderImplCopyWithImpl(
      _$AcceptOrderImpl _value, $Res Function(_$AcceptOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid_order = null,
    Object? sale_uuid = null,
  }) {
    return _then(_$AcceptOrderImpl(
      null == uuid_order
          ? _value.uuid_order
          : uuid_order // ignore: cast_nullable_to_non_nullable
              as String,
      null == sale_uuid
          ? _value.sale_uuid
          : sale_uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AcceptOrderImpl implements _AcceptOrder {
  const _$AcceptOrderImpl(this.uuid_order, this.sale_uuid);

  @override
  final String uuid_order;
  @override
  final String sale_uuid;

  @override
  String toString() {
    return 'OrdersEvent.acceptOrder(uuid_order: $uuid_order, sale_uuid: $sale_uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptOrderImpl &&
            (identical(other.uuid_order, uuid_order) ||
                other.uuid_order == uuid_order) &&
            (identical(other.sale_uuid, sale_uuid) ||
                other.sale_uuid == sale_uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid_order, sale_uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptOrderImplCopyWith<_$AcceptOrderImpl> get copyWith =>
      __$$AcceptOrderImplCopyWithImpl<_$AcceptOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOrders,
    required TResult Function(String offset) getOrdersOffset,
    required TResult Function(String filter) getOrdersFilter,
    required TResult Function(String offset, String filter)
        getOrdersFilterOffset,
    required TResult Function(String uuidOrder) getOrder,
    required TResult Function(String uuid_order) rejectOrder,
    required TResult Function(String uuid_order, String sale_uuid) confirmOrder,
    required TResult Function(String uuid_order, String sale_uuid) acceptOrder,
  }) {
    return acceptOrder(uuid_order, sale_uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOrders,
    TResult? Function(String offset)? getOrdersOffset,
    TResult? Function(String filter)? getOrdersFilter,
    TResult? Function(String offset, String filter)? getOrdersFilterOffset,
    TResult? Function(String uuidOrder)? getOrder,
    TResult? Function(String uuid_order)? rejectOrder,
    TResult? Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult? Function(String uuid_order, String sale_uuid)? acceptOrder,
  }) {
    return acceptOrder?.call(uuid_order, sale_uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOrders,
    TResult Function(String offset)? getOrdersOffset,
    TResult Function(String filter)? getOrdersFilter,
    TResult Function(String offset, String filter)? getOrdersFilterOffset,
    TResult Function(String uuidOrder)? getOrder,
    TResult Function(String uuid_order)? rejectOrder,
    TResult Function(String uuid_order, String sale_uuid)? confirmOrder,
    TResult Function(String uuid_order, String sale_uuid)? acceptOrder,
    required TResult orElse(),
  }) {
    if (acceptOrder != null) {
      return acceptOrder(uuid_order, sale_uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetOrdersEvent value) getOrders,
    required TResult Function(_GetOrdersOffsetEvent value) getOrdersOffset,
    required TResult Function(_GetOrdersFilterEvent value) getOrdersFilter,
    required TResult Function(_GetOrdersFilterOffsetEvent value)
        getOrdersFilterOffset,
    required TResult Function(_GetOrderEvent value) getOrder,
    required TResult Function(_RejectOrder value) rejectOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_AcceptOrder value) acceptOrder,
  }) {
    return acceptOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetOrdersEvent value)? getOrders,
    TResult? Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult? Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult? Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult? Function(_GetOrderEvent value)? getOrder,
    TResult? Function(_RejectOrder value)? rejectOrder,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_AcceptOrder value)? acceptOrder,
  }) {
    return acceptOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetOrdersEvent value)? getOrders,
    TResult Function(_GetOrdersOffsetEvent value)? getOrdersOffset,
    TResult Function(_GetOrdersFilterEvent value)? getOrdersFilter,
    TResult Function(_GetOrdersFilterOffsetEvent value)? getOrdersFilterOffset,
    TResult Function(_GetOrderEvent value)? getOrder,
    TResult Function(_RejectOrder value)? rejectOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_AcceptOrder value)? acceptOrder,
    required TResult orElse(),
  }) {
    if (acceptOrder != null) {
      return acceptOrder(this);
    }
    return orElse();
  }
}

abstract class _AcceptOrder implements OrdersEvent {
  const factory _AcceptOrder(final String uuid_order, final String sale_uuid) =
      _$AcceptOrderImpl;

  String get uuid_order;
  String get sale_uuid;
  @JsonKey(ignore: true)
  _$$AcceptOrderImplCopyWith<_$AcceptOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrdersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() logout,
    required TResult Function(String message) error,
    required TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)
        getOrders,
    required TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)
        getOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(String message)? error,
    TResult? Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult? Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(String message)? error,
    TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_GetOrder value) getOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_GetOrder value)? getOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_GetOrder value)? getOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersStateCopyWith<$Res> {
  factory $OrdersStateCopyWith(
          OrdersState value, $Res Function(OrdersState) then) =
      _$OrdersStateCopyWithImpl<$Res, OrdersState>;
}

/// @nodoc
class _$OrdersStateCopyWithImpl<$Res, $Val extends OrdersState>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._value, this._then);

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
    extends _$OrdersStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'OrdersState.loading()';
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
    required TResult Function() logout,
    required TResult Function(String message) error,
    required TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)
        getOrders,
    required TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)
        getOrder,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(String message)? error,
    TResult? Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult? Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(String message)? error,
    TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
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
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_GetOrder value) getOrder,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_GetOrder value)? getOrder,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_GetOrder value)? getOrder,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements OrdersState {
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
    extends _$OrdersStateCopyWithImpl<$Res, _$LogoutImpl>
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
    return 'OrdersState.logout()';
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
    required TResult Function() loading,
    required TResult Function() logout,
    required TResult Function(String message) error,
    required TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)
        getOrders,
    required TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)
        getOrder,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(String message)? error,
    TResult? Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult? Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(String message)? error,
    TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_GetOrder value) getOrder,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_GetOrder value)? getOrder,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_GetOrder value)? getOrder,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements OrdersState {
  const factory _Logout() = _$LogoutImpl;
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
    extends _$OrdersStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'OrdersState.error(message: $message)';
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
    required TResult Function() logout,
    required TResult Function(String message) error,
    required TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)
        getOrders,
    required TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)
        getOrder,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(String message)? error,
    TResult? Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult? Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(String message)? error,
    TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
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
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_GetOrder value) getOrder,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_GetOrder value)? getOrder,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_GetOrder value)? getOrder,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements OrdersState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOrdersImplCopyWith<$Res> {
  factory _$$GetOrdersImplCopyWith(
          _$GetOrdersImpl value, $Res Function(_$GetOrdersImpl) then) =
      __$$GetOrdersImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Order> orders,
      List<Order> filterOrders,
      List<Map<String, dynamic>> statuses});
}

/// @nodoc
class __$$GetOrdersImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$GetOrdersImpl>
    implements _$$GetOrdersImplCopyWith<$Res> {
  __$$GetOrdersImplCopyWithImpl(
      _$GetOrdersImpl _value, $Res Function(_$GetOrdersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? filterOrders = null,
    Object? statuses = null,
  }) {
    return _then(_$GetOrdersImpl(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      filterOrders: null == filterOrders
          ? _value._filterOrders
          : filterOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$GetOrdersImpl implements _GetOrders {
  const _$GetOrdersImpl(
      {required final List<Order> orders,
      required final List<Order> filterOrders,
      required final List<Map<String, dynamic>> statuses})
      : _orders = orders,
        _filterOrders = filterOrders,
        _statuses = statuses;

  final List<Order> _orders;
  @override
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<Order> _filterOrders;
  @override
  List<Order> get filterOrders {
    if (_filterOrders is EqualUnmodifiableListView) return _filterOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterOrders);
  }

  final List<Map<String, dynamic>> _statuses;
  @override
  List<Map<String, dynamic>> get statuses {
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statuses);
  }

  @override
  String toString() {
    return 'OrdersState.getOrders(orders: $orders, filterOrders: $filterOrders, statuses: $statuses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrdersImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality()
                .equals(other._filterOrders, _filterOrders) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_filterOrders),
      const DeepCollectionEquality().hash(_statuses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrdersImplCopyWith<_$GetOrdersImpl> get copyWith =>
      __$$GetOrdersImplCopyWithImpl<_$GetOrdersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() logout,
    required TResult Function(String message) error,
    required TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)
        getOrders,
    required TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)
        getOrder,
  }) {
    return getOrders(orders, filterOrders, statuses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(String message)? error,
    TResult? Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult? Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
  }) {
    return getOrders?.call(orders, filterOrders, statuses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(String message)? error,
    TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
    required TResult orElse(),
  }) {
    if (getOrders != null) {
      return getOrders(orders, filterOrders, statuses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_GetOrder value) getOrder,
  }) {
    return getOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_GetOrder value)? getOrder,
  }) {
    return getOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_GetOrder value)? getOrder,
    required TResult orElse(),
  }) {
    if (getOrders != null) {
      return getOrders(this);
    }
    return orElse();
  }
}

abstract class _GetOrders implements OrdersState {
  const factory _GetOrders(
      {required final List<Order> orders,
      required final List<Order> filterOrders,
      required final List<Map<String, dynamic>> statuses}) = _$GetOrdersImpl;

  List<Order> get orders;
  List<Order> get filterOrders;
  List<Map<String, dynamic>> get statuses;
  @JsonKey(ignore: true)
  _$$GetOrdersImplCopyWith<_$GetOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOrderImplCopyWith<$Res> {
  factory _$$GetOrderImplCopyWith(
          _$GetOrderImpl value, $Res Function(_$GetOrderImpl) then) =
      __$$GetOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Map<String, dynamic>> items,
      Map<String, dynamic>? sale,
      Map<String, dynamic> data});
}

/// @nodoc
class __$$GetOrderImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$GetOrderImpl>
    implements _$$GetOrderImplCopyWith<$Res> {
  __$$GetOrderImplCopyWithImpl(
      _$GetOrderImpl _value, $Res Function(_$GetOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? sale = freezed,
    Object? data = null,
  }) {
    return _then(_$GetOrderImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      sale: freezed == sale
          ? _value._sale
          : sale // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$GetOrderImpl implements _GetOrder {
  const _$GetOrderImpl(
      {required final List<Map<String, dynamic>> items,
      required final Map<String, dynamic>? sale,
      required final Map<String, dynamic> data})
      : _items = items,
        _sale = sale,
        _data = data;

  final List<Map<String, dynamic>> _items;
  @override
  List<Map<String, dynamic>> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final Map<String, dynamic>? _sale;
  @override
  Map<String, dynamic>? get sale {
    final value = _sale;
    if (value == null) return null;
    if (_sale is EqualUnmodifiableMapView) return _sale;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'OrdersState.getOrder(items: $items, sale: $sale, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrderImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._sale, _sale) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_sale),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrderImplCopyWith<_$GetOrderImpl> get copyWith =>
      __$$GetOrderImplCopyWithImpl<_$GetOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() logout,
    required TResult Function(String message) error,
    required TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)
        getOrders,
    required TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)
        getOrder,
  }) {
    return getOrder(items, sale, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? logout,
    TResult? Function(String message)? error,
    TResult? Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult? Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
  }) {
    return getOrder?.call(items, sale, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? logout,
    TResult Function(String message)? error,
    TResult Function(List<Order> orders, List<Order> filterOrders,
            List<Map<String, dynamic>> statuses)?
        getOrders,
    TResult Function(List<Map<String, dynamic>> items,
            Map<String, dynamic>? sale, Map<String, dynamic> data)?
        getOrder,
    required TResult orElse(),
  }) {
    if (getOrder != null) {
      return getOrder(items, sale, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Error value) error,
    required TResult Function(_GetOrders value) getOrders,
    required TResult Function(_GetOrder value) getOrder,
  }) {
    return getOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetOrders value)? getOrders,
    TResult? Function(_GetOrder value)? getOrder,
  }) {
    return getOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Logout value)? logout,
    TResult Function(_Error value)? error,
    TResult Function(_GetOrders value)? getOrders,
    TResult Function(_GetOrder value)? getOrder,
    required TResult orElse(),
  }) {
    if (getOrder != null) {
      return getOrder(this);
    }
    return orElse();
  }
}

abstract class _GetOrder implements OrdersState {
  const factory _GetOrder(
      {required final List<Map<String, dynamic>> items,
      required final Map<String, dynamic>? sale,
      required final Map<String, dynamic> data}) = _$GetOrderImpl;

  List<Map<String, dynamic>> get items;
  Map<String, dynamic>? get sale;
  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$GetOrderImplCopyWith<_$GetOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
