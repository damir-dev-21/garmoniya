import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String password;
  @HiveField(3)
  late String token;
  @HiveField(4)
  late int language;
  @HiveField(5)
  late Map<String, dynamic> customers;
  @HiveField(6)
  late String imei;
  @HiveField(7)
  late String messaging_token;
  @HiveField(8)
  bool access_act_sverki = false;
  @HiveField(9)
  late String type_device;
  @HiveField(10)
  String type_user = "customer";
}
