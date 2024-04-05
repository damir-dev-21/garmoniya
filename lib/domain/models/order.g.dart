// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      number: json['number'] as int,
      uuid: json['uuid'] as String,
      date: json['date'] as String,
      dateString: json['dateString'] as String,
      status: json['status'] as Map<String, dynamic>,
      filial: json['filial'] as String,
      typePayment: json['typePayment'] as String,
      amount: (json['amount'] as num).toDouble(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'uuid': instance.uuid,
      'date': instance.date,
      'dateString': instance.dateString,
      'status': instance.status,
      'filial': instance.filial,
      'typePayment': instance.typePayment,
      'amount': instance.amount,
      'comment': instance.comment,
    };
