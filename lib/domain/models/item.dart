import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.g.dart';
part 'item.freezed.dart';

@freezed
class Item with _$Item {
  factory Item(
      {required String id,
      required String uuid,
      required String name,
      required double price,
      required int quantiry_per_pack,
      required String unit,
      required String fabricator,
      required String date_overdue,
      required String date_overdue_real,
      required double remainder,
      required int currentCount,
      required int currentCount_free,
      required int discount,
      required bool discount_best,
      required int group,
      required int group_main,
      required String type_load,
      required String type_load_main,
      required String child_uuid,
      required String mark_load}) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
