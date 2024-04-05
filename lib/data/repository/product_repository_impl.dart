import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:garmoniya_pharm/data/config/urls.dart';
import 'package:http/http.dart' as http;
import 'package:garmoniya_pharm/utils/main_service.dart';
import '../../domain/models/item.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/products_repository.dart';
import '../local/hive_local.dart';

class ProductRepositoryImpl implements ProductRepository {
  // products

  @override
  Future<Map<String, dynamic>> getProductsSearch(limit, text) async {
    List<Item> products = [];
    var body = MainService.getDefaultBody();

    if (body['username'] == 'test') {
      Random random = Random();
      return {
        "status": true,
        "isAuth": true,
        "products": List.generate(
            100, (index) => MainService.getProducts()[random.nextInt(14)]),
      };
    }

    try {
      final responce = await http.post(Uri.parse(urlProducts),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({
            ...MainService.getDefaultBody(),
            "offset": limit,
            "text_search": text,
          }));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            Item product = MainService.getItemFromJson(element);
            products.add(product);
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
  Future<Map<String, dynamic>> getProductsOffset(limit) async {
    List<Item> products = [];

    var body = MainService.getDefaultBody();

    if (body['username'] == 'test') {
      Random random = Random();
      return {
        "status": true,
        "isAuth": true,
        "products": List.generate(
            100, (index) => MainService.getProducts()[random.nextInt(14)]),
      };
    }

    try {
      final responce = await http.post(Uri.parse(urlProducts),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({
            ...MainService.getDefaultBody(),
            "offset": limit,
          }));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            Item product = MainService.getItemFromJson(element);
            products.add(product);
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
  Future<Map<String, dynamic>> getProducts() async {
    List<Item> products = [];
    var body = MainService.getDefaultBody();

    if (body['username'] == 'test') {
      Random random = Random();
      return {
        "status": true,
        "isAuth": true,
        "products": List.generate(
            100, (index) => MainService.getProducts()[random.nextInt(14)]),
      };
    }

    try {
      final responce = await http.post(Uri.parse(urlProducts),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({...MainService.getDefaultBody()}));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            Item product = MainService.getItemFromJson(element);
            products.add(product);
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "products": products,
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

  // refuse

  @override
  Future<Map<String, dynamic>> getRefusal() async {
    List<Item> products = [];
    var body = MainService.getDefaultBody();

    if (body['username'] == 'test') {
      Random random = Random();
      return {
        "status": true,
        "isAuth": true,
        "products": List.generate(
            100, (index) => MainService.getProducts()[random.nextInt(14)]),
      };
    }

    try {
      final responce = await http.post(Uri.parse(urlRefusal),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({...MainService.getDefaultBody()}));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            Item product = MainService.getItemFromJson(element);
            products.add(product);
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
  Future<Map<String, dynamic>> sendRefuseList(Map<String, dynamic> data) async {
    try {
      final responce = await http.post(Uri.parse(urlSendRefusal),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({...MainService.getDefaultBody(), ...data}));
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

  @override
  Future<Map<String, dynamic>> getRefuseListProductsSearch(limit, text) async {
    List<Item> products = [];
    var body = MainService.getDefaultBody();

    if (body['username'] == 'test') {
      Random random = Random();
      return {
        "status": true,
        "isAuth": true,
        "products": List.generate(
            100, (index) => MainService.getProducts()[random.nextInt(14)]),
      };
    }

    try {
      final responce = await http.post(Uri.parse(urlRefuse),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({
            ...MainService.getDefaultBody(),
            "offset": limit,
            "text_search": text,
          }));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            Item product = MainService.getItemFromJson(element);
            products.add(product);
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "products": products,
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

  // filter

  @override
  Future<Map<String, dynamic>> getFilterProducts(data) async {
    List<Item> products = [];
    var body = MainService.getDefaultBody();

    if (body['username'] == 'test') {
      Random random = Random();
      return {
        "status": true,
        "isAuth": true,
        "products": List.generate(
            100, (index) => MainService.getProducts()[random.nextInt(14)]),
      };
    }

    try {
      final responce = await http.post(Uri.parse(urlProducts),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({...MainService.getDefaultBody(), ...data}));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            Item product = MainService.getItemFromJson(element);
            products.add(product);
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "products": products,
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

  @override
  Future<Map<String, dynamic>> getFilterProductsSearch(
      limit, text, data) async {
    List<Item> products = [];
    var body = MainService.getDefaultBody();

    if (body['username'] == 'test') {
      Random random = Random();
      return {
        "status": true,
        "isAuth": true,
        "products": List.generate(
            100, (index) => MainService.getProducts()[random.nextInt(14)]),
      };
    }

    try {
      final responce = await http.post(Uri.parse(urlProducts),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({
            ...MainService.getDefaultBody(),
            "offset": limit,
            "text_search": text,
            ...data
          }));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            Item product = MainService.getItemFromJson(element);
            products.add(product);
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "products": products,
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

  @override
  Future<Map<String, dynamic>> getFilterProductsOffset(limit, data) async {
    List<Item> products = [];
    var body = MainService.getDefaultBody();

    if (body['username'] == 'test') {
      Random random = Random();
      return {
        "status": true,
        "isAuth": true,
        "products": List.generate(
            100, (index) => MainService.getProducts()[random.nextInt(14)]),
      };
    }

    try {
      final responce = await http.post(Uri.parse(urlProducts),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode(
              {...MainService.getDefaultBody(), "offset": limit, ...data}));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            Item product = MainService.getItemFromJson(element);
            products.add(product);
          });

          // dateForLastSync = DateFormat("dd.MM.yy HH:mm").format(DateTime.now());
          return {
            "status": true,
            "products": products,
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

  // certificates

  @override
  Future<Map<String, dynamic>> getCertificates(data) async {
    List<Map<String, dynamic>> results = [];

    try {
      final responce = await http.post(Uri.parse(urlCertificates),
          headers: {...MainService.getDefaultAuth()!},
          body: jsonEncode({...MainService.getDefaultBody(), ...data}));
      String body = utf8.decode(responce.bodyBytes);

      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          extractedData['results'].forEach((element) async {
            results.add(element);
          });

          return {
            "status": true,
            "data": results,
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

  @override
  Future<Map<String, dynamic>> getCertificate(data) async {
    List<int> results = [];

    try {
      final responce = await http.get(Uri.parse("${urlCertificate + data}"),
          headers: {...MainService.getDefaultAuth()!});
      return {
        "status": true,
        "data": responce.bodyBytes,
        "isAuth": true,
      };
      // if (responce.statusCode == 200) {
      //   final extractedData = json.decode(body) as Map<String, dynamic>;
      //   if (extractedData['is_auth']) {
      //     // extractedData['results'].forEach((element) async {
      //     //   results.add(element);
      //     // });

      //     return {
      //       "status": true,
      //       "data": results,
      //       "isAuth": extractedData['is_auth'],
      //     };
      //   }
      //   return {
      //     "status": false,
      //     "isAuth": extractedData['is_auth'],
      //     "message": extractedData['message']
      //   };
      // } else {
      //   return {"status": false, "isAuth": true, "message": body};
      // }
    } catch (e) {
      print(e);
      return {"status": false, "isAuth": true, "message": e};
    }
  }
}
