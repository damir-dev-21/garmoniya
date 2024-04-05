import 'dart:convert';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:garmoniya_pharm/data/local/hive_local.dart';

import '../../../domain/models/user.dart';
import '../../../utils/device_info.dart';
import '../../../utils/main_service.dart';
import '../../config/urls.dart';
import '../../repository/firebase_repositoty_impl.dart';

abstract class AuthRemote {
  Map<String, dynamic> checkAuth();
  Future<Map<String, dynamic>> sync();
  Future<Map<String, dynamic>> login(Map<String, dynamic> data);
  Future<void> logout(Map<String, dynamic> data);
}

class AuthRemoteImpl implements AuthRemote {
  final DeviceInfo _deviceInfo = DeviceInfo();
  final FirebaseRepositoryImpl _firebaseRepositoryImpl =
      FirebaseRepositoryImpl();
  HiveLocal _hiveLocal = HiveLocal();
  @override
  Map<String, dynamic> checkAuth() {
    Box<User> getUser() => Hive.box<User>('users');
    final userDb = getUser().get('1');
    bool status = false;

    if (userDb == null && Platform.isIOS) {
      status = true;
    } else {
      status = userDb != null;
    }

    return {"status": status, "user": userDb};
  }

  @override
  Future<Map<String, dynamic>> sync() async {
    Map<String, dynamic> responceData = {};

    try {
      User? userDb = _hiveLocal.getUserFromDb();
      if (userDb == null) {
        return {"message": "Error user is not initialized", "status": false};
      }
      Map<String, dynamic> _requestData = {
        "username": userDb.name,
        "token": userDb.token,
        "imei": userDb.imei,
        "type_device": userDb.type_device
      };

      final responce = await http.post(Uri.parse(urlConfigure),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode(_requestData));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['token'] != null && extractedData['is_auth']) {
          // List list_of_customers = [];
          // extractedData['customers'].forEach((e) {
          //   if (e['customer_name'].isNotEmpty) {
          //     list_of_customers.add(e);
          //   }
          // });
          // List list_of_subdivisions = [];
          // extractedData['subdivision']
          //     .forEach((e) => list_of_subdivisions.add(e));

          User user = User()
            ..id = 1
            ..name = _requestData["username"]
            ..password = userDb.password
            ..token = extractedData['token']
            ..language = 0
            ..customers = {
              "uuid": extractedData['client']['code'],
              "client_name": extractedData['client']['name']
            }
            ..imei = _requestData["imei"]
            ..messaging_token = userDb.messaging_token
            ..access_act_sverki = extractedData['access_act_sverki']
            ..type_device = _requestData['type_device']
            ..type_user = extractedData['type_user'];
          // subdivision = user.subdivisions[0];
          // context.read<CartProvider>().client = user.customers[0];
          // getLangs().put('1', user);
          // _databaseHelper.insertImei({"imei": imei});
          // checkConnection();
          responceData['user'] = user;
          responceData['status'] = true;
          responceData['message'] = extractedData['message'];
          responceData['contacts'] = extractedData['contacts'];
          // responceData['language'] = extractedData['language'];

          Box<User> getUser() => Hive.box<User>('users');
          getUser().delete("1");
          getUser().put('1', user);
        } else {
          responceData['status'] = false;
          responceData['message'] = extractedData['message'];
        }
      } else {
        responceData['status'] = false;
        responceData['message'] = body;
      }
    } catch (e) {
      print(e);
      responceData['status'] = false;
      responceData['message'] = e;
      rethrow;
    }
    return responceData;
  }

  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    Map<String, dynamic> responceData = {};
    try {
      var _imei = await _deviceInfo.getImeiDevice();
      var _device_type = await _deviceInfo.getTypeDevice();

      var _token = await _firebaseRepositoryImpl.getTokenMessaging();
      Map<String, dynamic> _requestData = {
        ...data,
        "imei": _imei.toString(),
        "token_firebase": _token,
        "type_device": _device_type
      };

      final responce = await http.post(Uri.parse(urlLogin),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode(_requestData));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['token'] != null && extractedData['is_auth']) {
          // List list_of_customers = [];
          // extractedData['customers'].forEach((e) {
          //   if (e['customer_name'].isNotEmpty) {
          //     list_of_customers.add(e);
          //   }
          // });
          // List list_of_subdivisions = [];
          // extractedData['subdivision']
          //     .forEach((e) => list_of_subdivisions.add(e));
          print(extractedData);
          User _user = User()
            ..id = 1
            ..name = _requestData["username"]
            ..password = _requestData["password"]
            ..token = extractedData['token']
            ..language = 0
            ..customers = {
              "uuid": extractedData['code'],
              "client_name": extractedData['name']
            }
            ..imei = _requestData["imei"]
            ..messaging_token = _requestData["token_firebase"]
            ..access_act_sverki = extractedData['access_act_sverki']
            ..type_device = _device_type
            ..type_user = extractedData['type_user'];
          // subdivision = user.subdivisions[0];
          // context.read<CartProvider>().client = user.customers[0];
          // getLangs().put('1', user);
          // _databaseHelper.insertImei({"imei": imei});
          // checkConnection();
          responceData['user'] = _user;
          responceData['status'] = true;
          responceData['message'] = extractedData['message'];

          Box<User> getUser() => Hive.box<User>('users');
          getUser().put('1', _user);
        } else {
          responceData['status'] = false;
          responceData['message'] = extractedData['message'];
        }
      } else {
        responceData['status'] = false;
        responceData['message'] = body;
      }
    } catch (e) {
      print(e);
      responceData['status'] = false;
      responceData['message'] = e;
      rethrow;
    }
    return responceData;
  }

  Future<void> logout(Map<String, dynamic> data) async {
    try {
      final responce = await http.post(Uri.parse(urlLogout),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({
            ...MainService.getDefaultBody(),
          }));
      print("Logout is ${responce.statusCode}");

      Box<User> getUser() => Hive.box<User>('users');
      getUser().delete('1');
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
