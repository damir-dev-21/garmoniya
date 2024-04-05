import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.g.dart';
part 'order.freezed.dart';

@freezed
class Order with _$Order {
  factory Order(
      {required int number,
      required String uuid,
      required String date,
      required String dateString,
      required Map<String, dynamic> status,
      required String filial,
      required String typePayment,
      required double amount,
      required String comment}) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
