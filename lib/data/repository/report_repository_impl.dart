import 'dart:convert';

import 'package:garmoniya_pharm/data/config/urls.dart';
import 'package:garmoniya_pharm/domain/repository/report_repository.dart';
import 'package:http/http.dart' as http;

import '../../utils/main_service.dart';

class ReportRepositoryImpl implements ReportRepository {
  @override
  Future<Map<String, dynamic>> getData(Map<String, dynamic> data) async {
    Map<String, dynamic> _data = {};

    try {
      final responce = await http.post(Uri.parse(urlReport),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({...MainService.getDefaultBody(), ...data}));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          _data = {
            "initial_balance_dt": extractedData['result']['initial_balance_dt'],
            "initial_balance_ct": extractedData['result']['initial_balance_ct'],
            "final_balance_dt": extractedData['result']['final_balance_dt'],
            "final_balance_ct": extractedData['result']['final_balance_ct'],
            "turnover_dt": extractedData['result']['turnover_dt'],
            "turnover_ct": extractedData['result']['turnover_ct'],
            "turnover_results": extractedData['result']['turnover_results'],
          };

          return {
            "status": true,
            "data": _data,
            "base64": extractedData['file_base64'],
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
