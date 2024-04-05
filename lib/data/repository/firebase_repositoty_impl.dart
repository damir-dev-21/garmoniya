import 'package:firebase_messaging/firebase_messaging.dart';

import '../../domain/repository/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  getTokenMessaging() async {
    return await _firebaseMessaging.getToken().then((value) => value!);
  }
}
