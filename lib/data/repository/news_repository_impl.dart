import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:garmoniya_pharm/data/config/urls.dart';
import 'package:garmoniya_pharm/data/local/hive_local.dart';
import 'package:garmoniya_pharm/domain/repository/news_repository.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/user.dart';

class NewsRepositoryImp implements NewsRepository {
  HiveLocal _hiveLocal = HiveLocal();
  @override
  Future<Map<String, dynamic>> getNews() async {
    List<Map<String, dynamic>> news = [];

    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlGetNews),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "offset": "",
            "last_seen": ""
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            DateTime dateTime =
                DateTime.parse(element["date"] ?? "") ?? DateTime(1, 1, 1);
            String formattedDate =
                DateFormat('dd.MM.yyyy – HH:mm').format(dateTime);

            news.add({"dateOverdue": formattedDate, ...element});
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
            "news": news,
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
  Future<Map<String, dynamic>> getNewsOffset(last_date) async {
    List<Map<String, dynamic>> news = [];

    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlGetNews),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "offset": last_date,
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            DateTime dateTime =
                DateTime.parse(element["date"] ?? "") ?? DateTime(1, 1, 1);
            String formattedDate =
                DateFormat('dd.MM.yyyy – HH:mm').format(dateTime);

            news.add({"dateOverdue": formattedDate, ...element});
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
            "news": news,
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
  Future<Map<String, dynamic>> getNewsDetail(uuid) async {
    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    try {
      final responce = await http.post(Uri.parse(urlOpenNew),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            "new_uuid": uuid,
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
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
