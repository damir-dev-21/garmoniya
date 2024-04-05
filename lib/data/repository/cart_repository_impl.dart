import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:garmoniya_pharm/data/config/urls.dart';
import 'package:garmoniya_pharm/data/local/hive_local.dart';
import 'package:garmoniya_pharm/domain/models/user.dart';
import 'package:garmoniya_pharm/domain/repository/cart_repository.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/item.dart';

class CartRepositoryImpl implements CartRepository {
  HiveLocal _hiveLocal = HiveLocal();

  @override
  Future<Map<String, dynamic>> sendOrder(Map<String, dynamic> data) async {
    List<Map<String, dynamic>> checks = [];

    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlOrder),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "type_device": user.type_device,
            ...data
          }));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          if (!extractedData['ok']) {
            extractedData['message'].forEach((element) async {
              checks.add(element);
            });
            return {
              "status": true,
              "sended": false,
              "checks": checks,
            };
          } else {
            return {
              "status": true,
              "sended": true,
              "checks": checks,
            };
          }
        }
        return {"status": false, "message": extractedData['message']};
      } else {
        return {"status": false, "message": body};
      }
    } catch (e) {
      print(e);
      return {"status": false, "message": e};
    }
  }

  @override
  Future<Map<String, dynamic>> getCart() async {
    List<Item> products = [];

    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlCart),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "type_device": user.type_device
          }));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            DateTime date =
                DateTime.tryParse(element["date_overdue"]) ?? DateTime(1, 1, 1);
            DateFormat _format = DateFormat("dd.mm.yyyy hh:mm:ss");
            String date_overdue = _format.format(date);
            Item product = Item(
                id: element['uuid'],
                uuid: element['uuid'],
                name: element['name'],
                price: double.parse(element['price'].toString()),
                currentCount: element['quantity_choice'],
                date_overdue: date_overdue,
                date_overdue_real: element["date_overdue"],
                quantiry_per_pack:
                    int.parse(element['quantity_per_pack'].toString()),
                unit: element['unit'],
                remainder: double.parse(element['remainder'].toString()),
                fabricator: element['fabricator'],
                type_load_main: element['type_load_main'],
                currentCount_free: element['quantity_free_choice'],
                group: element['group'],
                group_main: element['group_main'],
                type_load: element['type_load'],
                child_uuid: element['child_uuid'],
                discount: element['discount'],
                discount_best: element['discount_best'],
                mark_load: element['mark_load_main']);

            // if (product.name != '' && product.price != 0) {
            products.add(product);
            // }
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
            "products": products,
          };
        }
        return {
          "status": false,
          "isAuth": extractedData['is_auth'],
          "message": extractedData['message']
        };
      } else {
        return {"status": false, "isAuth": true, "message": body};
      }
    } catch (e) {
      print(e);
      return {"status": false, "isAuth": true, "message": e};
    }
  }

  @override
  Future<Map<String, dynamic>> sendCart(Map<String, dynamic> data) async {
    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlSendCart),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "type_device": user.type_device,
            ...data
          }));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
            "message": extractedData['message'],
          };
        }
        return {
          "status": false,
          "isAuth": extractedData['is_auth'],
          "message": extractedData['message']
        };
      } else {
        return {"status": false, "isAuth": true, "message": body};
      }
    } catch (e) {
      print(e);
      return {"status": false, "isAuth": true, "message": e};
    }
  }
}
