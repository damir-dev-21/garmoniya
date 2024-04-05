// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: json['id'] as String,
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantiry_per_pack: json['quantiry_per_pack'] as int,
      unit: json['unit'] as String,
      fabricator: json['fabricator'] as String,
      date_overdue: json['date_overdue'] as String,
      date_overdue_real: json['date_overdue_real'] as String,
      remainder: (json['remainder'] as num).toDouble(),
      currentCount: json['currentCount'] as int,
      currentCount_free: json['currentCount_free'] as int,
      discount: json['discount'] as int,
      discount_best: json['discount_best'] as bool,
      group: json['group'] as int,
      group_main: json['group_main'] as int,
      type_load: json['type_load'] as String,
      type_load_main: json['type_load_main'] as String,
      child_uuid: json['child_uuid'] as String,
      mark_load: json['mark_load'] as String,
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'price': instance.price,
      'quantiry_per_pack': instance.quantiry_per_pack,
      'unit': instance.unit,
      'fabricator': instance.fabricator,
      'date_overdue': instance.date_overdue,
      'date_overdue_real': instance.date_overdue_real,
      'remainder': instance.remainder,
      'currentCount': instance.currentCount,
      'currentCount_free': instance.currentCount_free,
      'discount': instance.discount,
      'discount_best': instance.discount_best,
      'group': instance.group,
      'group_main': instance.group_main,
      'type_load': instance.type_load,
      'type_load_main': instance.type_load_main,
      'child_uuid': instance.child_uuid,
      'mark_load': instance.mark_load,
    };
