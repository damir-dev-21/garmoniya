import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:garmoniya_pharm/data/config/urls.dart';
import 'package:garmoniya_pharm/domain/repository/orders_repository.dart';
import 'package:http/http.dart' as http;
import 'package:garmoniya_pharm/utils/shared_prefs.dart';
import '../../domain/models/item.dart';
import '../../domain/models/order.dart';
import '../../domain/models/user.dart';
import '../local/hive_local.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  HiveLocal _hiveLocal = HiveLocal();

  @override
  Future<Map<String, dynamic>> getOrders() async {
    List<Order> orders = [];

    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlGetOrder),
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
            final DateFormat outputFormat = DateFormat("dd.MM.yyyy hh:mm:ss");
            DateTime date =
                DateTime.tryParse(element["date"]) ?? DateTime(1, 1, 1);
            String formatedDate = outputFormat.format(date);
            Order order = Order(
              number: element['number'],
              uuid: element['uuid'],
              date: element['date'],
              dateString: formatedDate,
              filial: element['filial'],
              typePayment: element['type_payment'],
              amount: double.parse((element['amount'] ?? 0).toString()),
              status: element['status'],
              comment: element['comment'],
            );

            orders.add(order);
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "isAuth": extractedData['isAuth'],
            "orders": orders,
          };
        }
        return {
          "status": false,
          "isAuth": extractedData['isAuth'],
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
  Future<Map<String, dynamic>> getConfigure() async {
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
      };

      final responce = await http.post(Uri.parse(urlConfigure),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode(_requestData));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['token'] != null && extractedData['is_auth']) {
          responceData['statuses'] = extractedData['statutes'];
          responceData['status'] = true;
          responceData['message'] = extractedData['message'];
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
  Future<Map<String, dynamic>> getOrdersFilter(filter) async {
    List<Order> orders = [];

    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlGetOrder),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "type_device": user.type_device,
            "imei": user.imei,
            "filter_status": filter
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            final DateFormat outputFormat = DateFormat("dd.MM.yyyy hh:mm:ss");
            DateTime date =
                DateTime.tryParse(element["date"]) ?? DateTime(1, 1, 1);
            String formatedDate = outputFormat.format(date);
            Order order = Order(
              number: element['number'],
              uuid: element['uuid'],
              date: element['date'],
              dateString: formatedDate,
              filial: element['filial'],
              typePayment: element['type_payment'],
              amount: element['amount'],
              status: element['status'],
              comment: element['comment'],
            );

            orders.add(order);
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
            "orders": orders,
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
      return {"status": false, "isAuth": false, "message": e};
    }
  }

  @override
  Future<Map<String, dynamic>> getOrdersOffset(offset) async {
    List<Order> orders = [];

    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlGetOrder),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "offset": offset,
            "type_device": user.type_device
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            final DateFormat outputFormat = DateFormat("dd.MM.yyyy hh:mm:ss");
            DateTime date =
                DateTime.tryParse(element["date"]) ?? DateTime(1, 1, 1);
            String formatedDate = outputFormat.format(date);
            Order order = Order(
              number: element['number'],
              uuid: element['uuid'],
              date: element['date'],
              dateString: formatedDate,
              filial: element['filial'],
              typePayment: element['type_payment'],
              amount: element['amount'],
              status: element['status'],
              comment: element['comment'],
            );

            orders.add(order);
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
            "orders": orders,
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
      return {"status": false, "isAuth": false, "message": e};
    }
  }

  @override
  Future<Map<String, dynamic>> getOrdersFilterOffset(offset, filter) async {
    List<Order> orders = [];

    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlGetOrder),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "filter_status": filter,
            "offset": offset,
            "type_device": user.type_device
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            final DateFormat outputFormat = DateFormat("dd.MM.yyyy hh:mm:ss");
            DateTime date =
                DateTime.tryParse(element["date"]) ?? DateTime(1, 1, 1);
            String formatedDate = outputFormat.format(date);
            Order order = Order(
              number: element['number'],
              uuid: element['uuid'],
              date: element['date'],
              dateString: formatedDate,
              filial: element['filial'],
              typePayment: element['type_payment'],
              amount: element['amount'],
              status: element['status'],
              comment: element['comment'],
            );

            orders.add(order);
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
            "orders": orders,
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
      return {"status": false, "isAuth": false, "message": e};
    }
  }

  @override
  Future<Map<String, dynamic>> getOrder(uuidOrder) async {
    List<Map<String, dynamic>> items = [];

    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlOrderItem),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "order_uuid": uuidOrder,
            "type_device": user.type_device
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) {
            items.add(element);
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
            "items": items,
            "details": {
              "number": extractedData['number'],
              "cancel": extractedData['access_cancellation'] ?? false
            },
            "sale": extractedData['sale']
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
      return {"status": false, "isAuth": false, "message": e};
    }
  }

  @override
  Future<Map<String, dynamic>> confirmOrder(sale_uuid) async {
    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlConfirm),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "sale_uuid": sale_uuid
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          return {
            "status": extractedData['ok'],
            "isAuth": extractedData['is_auth'],
            "message": extractedData['message'] != null
                ? extractedData['message'][SharedPrefs().locale]
                : ""
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
      return {"status": false, "isAuth": false, "message": e};
    }
  }

  @override
  Future<Map<String, dynamic>> acceptedOrder(sale_uuid) async {
    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlAccepted),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "sale_uuid": sale_uuid
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          return {
            "status": extractedData['ok'],
            "isAuth": extractedData['is_auth'],
            "message": extractedData['message'] != null
                ? extractedData['message'][SharedPrefs().locale]
                : ""
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
      return {"status": false, "isAuth": false, "message": e};
    }
  }

  @override
  Future<Map<String, dynamic>> rejectOrder(order_uuid) async {
    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlReject),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "order_uuid": order_uuid
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          return {
            "status": extractedData['ok'],
            "isAuth": extractedData['is_auth'],
            "message": extractedData['message'] != null
                ? extractedData['message'][SharedPrefs().locale]
                : ""
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
      return {"status": false, "isAuth": false, "message": e};
    }
  }
}
