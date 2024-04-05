// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..id = fields[0] as int
      ..name = fields[1] as String
      ..password = fields[2] as String
      ..token = fields[3] as String
      ..language = fields[4] as int
      ..customers = (fields[5] as Map).cast<String, dynamic>()
      ..imei = fields[6] as String
      ..messaging_token = fields[7] as String
      ..access_act_sverki = fields[8] as bool
      ..type_device = fields[9] as String
      ..type_user = fields[10] as String;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.language)
      ..writeByte(5)
      ..write(obj.customers)
      ..writeByte(6)
      ..write(obj.imei)
      ..writeByte(7)
      ..write(obj.messaging_token)
      ..writeByte(8)
      ..write(obj.access_act_sverki)
      ..writeByte(9)
      ..write(obj.type_device)
      ..writeByte(10)
      ..write(obj.type_user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
