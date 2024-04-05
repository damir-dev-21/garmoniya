// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantiry_per_pack => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get fabricator => throw _privateConstructorUsedError;
  String get date_overdue => throw _privateConstructorUsedError;
  String get date_overdue_real => throw _privateConstructorUsedError;
  double get remainder => throw _privateConstructorUsedError;
  int get currentCount => throw _privateConstructorUsedError;
  int get currentCount_free => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  bool get discount_best => throw _privateConstructorUsedError;
  int get group => throw _privateConstructorUsedError;
  int get group_main => throw _privateConstructorUsedError;
  String get type_load => throw _privateConstructorUsedError;
  String get type_load_main => throw _privateConstructorUsedError;
  String get child_uuid => throw _privateConstructorUsedError;
  String get mark_load => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String id,
      String uuid,
      String name,
      double price,
      int quantiry_per_pack,
      String unit,
      String fabricator,
      String date_overdue,
      String date_overdue_real,
      double remainder,
      int currentCount,
      int currentCount_free,
      int discount,
      bool discount_best,
      int group,
      int group_main,
      String type_load,
      String type_load_main,
      String child_uuid,
      String mark_load});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? price = null,
    Object? quantiry_per_pack = null,
    Object? unit = null,
    Object? fabricator = null,
    Object? date_overdue = null,
    Object? date_overdue_real = null,
    Object? remainder = null,
    Object? currentCount = null,
    Object? currentCount_free = null,
    Object? discount = null,
    Object? discount_best = null,
    Object? group = null,
    Object? group_main = null,
    Object? type_load = null,
    Object? type_load_main = null,
    Object? child_uuid = null,
    Object? mark_load = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantiry_per_pack: null == quantiry_per_pack
          ? _value.quantiry_per_pack
          : quantiry_per_pack // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      fabricator: null == fabricator
          ? _value.fabricator
          : fabricator // ignore: cast_nullable_to_non_nullable
              as String,
      date_overdue: null == date_overdue
          ? _value.date_overdue
          : date_overdue // ignore: cast_nullable_to_non_nullable
              as String,
      date_overdue_real: null == date_overdue_real
          ? _value.date_overdue_real
          : date_overdue_real // ignore: cast_nullable_to_non_nullable
              as String,
      remainder: null == remainder
          ? _value.remainder
          : remainder // ignore: cast_nullable_to_non_nullable
              as double,
      currentCount: null == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentCount_free: null == currentCount_free
          ? _value.currentCount_free
          : currentCount_free // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      discount_best: null == discount_best
          ? _value.discount_best
          : discount_best // ignore: cast_nullable_to_non_nullable
              as bool,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int,
      group_main: null == group_main
          ? _value.group_main
          : group_main // ignore: cast_nullable_to_non_nullable
              as int,
      type_load: null == type_load
          ? _value.type_load
          : type_load // ignore: cast_nullable_to_non_nullable
              as String,
      type_load_main: null == type_load_main
          ? _value.type_load_main
          : type_load_main // ignore: cast_nullable_to_non_nullable
              as String,
      child_uuid: null == child_uuid
          ? _value.child_uuid
          : child_uuid // ignore: cast_nullable_to_non_nullable
              as String,
      mark_load: null == mark_load
          ? _value.mark_load
          : mark_load // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String uuid,
      String name,
      double price,
      int quantiry_per_pack,
      String unit,
      String fabricator,
      String date_overdue,
      String date_overdue_real,
      double remainder,
      int currentCount,
      int currentCount_free,
      int discount,
      bool discount_best,
      int group,
      int group_main,
      String type_load,
      String type_load_main,
      String child_uuid,
      String mark_load});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? price = null,
    Object? quantiry_per_pack = null,
    Object? unit = null,
    Object? fabricator = null,
    Object? date_overdue = null,
    Object? date_overdue_real = null,
    Object? remainder = null,
    Object? currentCount = null,
    Object? currentCount_free = null,
    Object? discount = null,
    Object? discount_best = null,
    Object? group = null,
    Object? group_main = null,
    Object? type_load = null,
    Object? type_load_main = null,
    Object? child_uuid = null,
    Object? mark_load = null,
  }) {
    return _then(_$ItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantiry_per_pack: null == quantiry_per_pack
          ? _value.quantiry_per_pack
          : quantiry_per_pack // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      fabricator: null == fabricator
          ? _value.fabricator
          : fabricator // ignore: cast_nullable_to_non_nullable
              as String,
      date_overdue: null == date_overdue
          ? _value.date_overdue
          : date_overdue // ignore: cast_nullable_to_non_nullable
              as String,
      date_overdue_real: null == date_overdue_real
          ? _value.date_overdue_real
          : date_overdue_real // ignore: cast_nullable_to_non_nullable
              as String,
      remainder: null == remainder
          ? _value.remainder
          : remainder // ignore: cast_nullable_to_non_nullable
              as double,
      currentCount: null == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentCount_free: null == currentCount_free
          ? _value.currentCount_free
          : currentCount_free // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      discount_best: null == discount_best
          ? _value.discount_best
          : discount_best // ignore: cast_nullable_to_non_nullable
              as bool,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int,
      group_main: null == group_main
          ? _value.group_main
          : group_main // ignore: cast_nullable_to_non_nullable
              as int,
      type_load: null == type_load
          ? _value.type_load
          : type_load // ignore: cast_nullable_to_non_nullable
              as String,
      type_load_main: null == type_load_main
          ? _value.type_load_main
          : type_load_main // ignore: cast_nullable_to_non_nullable
              as String,
      child_uuid: null == child_uuid
          ? _value.child_uuid
          : child_uuid // ignore: cast_nullable_to_non_nullable
              as String,
      mark_load: null == mark_load
          ? _value.mark_load
          : mark_load // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  _$ItemImpl(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.price,
      required this.quantiry_per_pack,
      required this.unit,
      required this.fabricator,
      required this.date_overdue,
      required this.date_overdue_real,
      required this.remainder,
      required this.currentCount,
      required this.currentCount_free,
      required this.discount,
      required this.discount_best,
      required this.group,
      required this.group_main,
      required this.type_load,
      required this.type_load_main,
      required this.child_uuid,
      required this.mark_load});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String id;
  @override
  final String uuid;
  @override
  final String name;
  @override
  final double price;
  @override
  final int quantiry_per_pack;
  @override
  final String unit;
  @override
  final String fabricator;
  @override
  final String date_overdue;
  @override
  final String date_overdue_real;
  @override
  final double remainder;
  @override
  final int currentCount;
  @override
  final int currentCount_free;
  @override
  final int discount;
  @override
  final bool discount_best;
  @override
  final int group;
  @override
  final int group_main;
  @override
  final String type_load;
  @override
  final String type_load_main;
  @override
  final String child_uuid;
  @override
  final String mark_load;

  @override
  String toString() {
    return 'Item(id: $id, uuid: $uuid, name: $name, price: $price, quantiry_per_pack: $quantiry_per_pack, unit: $unit, fabricator: $fabricator, date_overdue: $date_overdue, date_overdue_real: $date_overdue_real, remainder: $remainder, currentCount: $currentCount, currentCount_free: $currentCount_free, discount: $discount, discount_best: $discount_best, group: $group, group_main: $group_main, type_load: $type_load, type_load_main: $type_load_main, child_uuid: $child_uuid, mark_load: $mark_load)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantiry_per_pack, quantiry_per_pack) ||
                other.quantiry_per_pack == quantiry_per_pack) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.fabricator, fabricator) ||
                other.fabricator == fabricator) &&
            (identical(other.date_overdue, date_overdue) ||
                other.date_overdue == date_overdue) &&
            (identical(other.date_overdue_real, date_overdue_real) ||
                other.date_overdue_real == date_overdue_real) &&
            (identical(other.remainder, remainder) ||
                other.remainder == remainder) &&
            (identical(other.currentCount, currentCount) ||
                other.currentCount == currentCount) &&
            (identical(other.currentCount_free, currentCount_free) ||
                other.currentCount_free == currentCount_free) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discount_best, discount_best) ||
                other.discount_best == discount_best) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.group_main, group_main) ||
                other.group_main == group_main) &&
            (identical(other.type_load, type_load) ||
                other.type_load == type_load) &&
            (identical(other.type_load_main, type_load_main) ||
                other.type_load_main == type_load_main) &&
            (identical(other.child_uuid, child_uuid) ||
                other.child_uuid == child_uuid) &&
            (identical(other.mark_load, mark_load) ||
                other.mark_load == mark_load));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uuid,
        name,
        price,
        quantiry_per_pack,
        unit,
        fabricator,
        date_overdue,
        date_overdue_real,
        remainder,
        currentCount,
        currentCount_free,
        discount,
        discount_best,
        group,
        group_main,
        type_load,
        type_load_main,
        child_uuid,
        mark_load
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  factory _Item(
      {required final String id,
      required final String uuid,
      required final String name,
      required final double price,
      required final int quantiry_per_pack,
      required final String unit,
      required final String fabricator,
      required final String date_overdue,
      required final String date_overdue_real,
      required final double remainder,
      required final int currentCount,
      required final int currentCount_free,
      required final int discount,
      required final bool discount_best,
      required final int group,
      required final int group_main,
      required final String type_load,
      required final String type_load_main,
      required final String child_uuid,
      required final String mark_load}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get id;
  @override
  String get uuid;
  @override
  String get name;
  @override
  double get price;
  @override
  int get quantiry_per_pack;
  @override
  String get unit;
  @override
  String get fabricator;
  @override
  String get date_overdue;
  @override
  String get date_overdue_real;
  @override
  double get remainder;
  @override
  int get currentCount;
  @override
  int get currentCount_free;
  @override
  int get discount;
  @override
  bool get discount_best;
  @override
  int get group;
  @override
  int get group_main;
  @override
  String get type_load;
  @override
  String get type_load_main;
  @override
  String get child_uuid;
  @override
  String get mark_load;
  @override
  @JsonKey(ignore: true)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
