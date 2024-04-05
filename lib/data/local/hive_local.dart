import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/user.dart';

class HiveLocal {
  getUserFromDb() {
    Box<User> getUser() => Hive.box<User>('users');
    User? userDb = getUser().get('1');

    return userDb;
  }
}
