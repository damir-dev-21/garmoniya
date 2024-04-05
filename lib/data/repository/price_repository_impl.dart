import 'dart:convert';

import 'package:garmoniya_pharm/data/config/urls.dart';
import 'package:garmoniya_pharm/domain/repository/price_repository.dart';
import 'package:http/http.dart' as http;

import '../../utils/main_service.dart';

class PriceRepositoryImpl implements PriceRepository {
  @override
  Future<Map<String, dynamic>> getPrice() async {
    List<Map<String, dynamic>> price = [];

    try {
      final responce = await http.post(Uri.parse(urlPrice),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({
            ...MainService.getDefaultBody(),
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            price.add(element);
          });

          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
            "price": price,
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
