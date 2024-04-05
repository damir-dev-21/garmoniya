// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int get number => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get dateString => throw _privateConstructorUsedError;
  Map<String, dynamic> get status => throw _privateConstructorUsedError;
  String get filial => throw _privateConstructorUsedError;
  String get typePayment => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int number,
      String uuid,
      String date,
      String dateString,
      Map<String, dynamic> status,
      String filial,
      String typePayment,
      double amount,
      String comment});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? uuid = null,
    Object? date = null,
    Object? dateString = null,
    Object? status = null,
    Object? filial = null,
    Object? typePayment = null,
    Object? amount = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dateString: null == dateString
          ? _value.dateString
          : dateString // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      filial: null == filial
          ? _value.filial
          : filial // ignore: cast_nullable_to_non_nullable
              as String,
      typePayment: null == typePayment
          ? _value.typePayment
          : typePayment // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int number,
      String uuid,
      String date,
      String dateString,
      Map<String, dynamic> status,
      String filial,
      String typePayment,
      double amount,
      String comment});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? uuid = null,
    Object? date = null,
    Object? dateString = null,
    Object? status = null,
    Object? filial = null,
    Object? typePayment = null,
    Object? amount = null,
    Object? comment = null,
  }) {
    return _then(_$OrderImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dateString: null == dateString
          ? _value.dateString
          : dateString // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      filial: null == filial
          ? _value.filial
          : filial // ignore: cast_nullable_to_non_nullable
              as String,
      typePayment: null == typePayment
          ? _value.typePayment
          : typePayment // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  _$OrderImpl(
      {required this.number,
      required this.uuid,
      required this.date,
      required this.dateString,
      required final Map<String, dynamic> status,
      required this.filial,
      required this.typePayment,
      required this.amount,
      required this.comment})
      : _status = status;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int number;
  @override
  final String uuid;
  @override
  final String date;
  @override
  final String dateString;
  final Map<String, dynamic> _status;
  @override
  Map<String, dynamic> get status {
    if (_status is EqualUnmodifiableMapView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_status);
  }

  @override
  final String filial;
  @override
  final String typePayment;
  @override
  final double amount;
  @override
  final String comment;

  @override
  String toString() {
    return 'Order(number: $number, uuid: $uuid, date: $date, dateString: $dateString, status: $status, filial: $filial, typePayment: $typePayment, amount: $amount, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateString, dateString) ||
                other.dateString == dateString) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            (identical(other.filial, filial) || other.filial == filial) &&
            (identical(other.typePayment, typePayment) ||
                other.typePayment == typePayment) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      number,
      uuid,
      date,
      dateString,
      const DeepCollectionEquality().hash(_status),
      filial,
      typePayment,
      amount,
      comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  factory _Order(
      {required final int number,
      required final String uuid,
      required final String date,
      required final String dateString,
      required final Map<String, dynamic> status,
      required final String filial,
      required final String typePayment,
      required final double amount,
      required final String comment}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int get number;
  @override
  String get uuid;
  @override
  String get date;
  @override
  String get dateString;
  @override
  Map<String, dynamic> get status;
  @override
  String get filial;
  @override
  String get typePayment;
  @override
  double get amount;
  @override
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
