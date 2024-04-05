import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/config/urls.dart';
import '../data/local/hive_local.dart';
import '../domain/models/item.dart';
import '../domain/models/user.dart';

class MainService {
  static getProducts() {
    return [
      Item(
          id: "1",
          uuid: "1",
          name: 'Футболка Polo',
          price: 34,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "2",
          uuid: "2",
          name: 'Adidas кросовки',
          price: 150,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "3",
          uuid: "3",
          name: 'Nike кросовки',
          price: 170,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "4",
          uuid: "4",
          name: 'Кросовки puma',
          price: 132,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Puma",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "5",
          uuid: "5",
          name: 'Футболка белая',
          price: 45,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "6",
          uuid: "6",
          name: 'Шорты летние',
          price: 50,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "7",
          uuid: "7",
          name: 'Рубажка летняя',
          price: 60,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "8",
          uuid: "8",
          name: 'Трусы женские',
          price: 30,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "9",
          uuid: "9",
          name: 'Трусы мужские',
          price: 20,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "10",
          uuid: "10",
          name: 'Майка мужская',
          price: 30,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "11",
          uuid: "11",
          name: 'Ветровка Adidas',
          price: 60,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "12",
          uuid: "12",
          name: 'Ветровка Nike',
          price: 60,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "13",
          uuid: "13",
          name: 'Ветровка Puma',
          price: 60,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "14",
          uuid: "14",
          name: 'Клюшка для гольфа',
          price: 80,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
      Item(
          id: "15",
          uuid: "15",
          name: 'Бутылка детская 180мл',
          price: 20,
          quantiry_per_pack: 1,
          unit: "",
          fabricator: "Polo",
          date_overdue: "30.03.2024",
          date_overdue_real: "30.03.2024",
          remainder: 10,
          currentCount: 0,
          currentCount_free: 0,
          discount: 0,
          discount_best: false,
          group: 1,
          group_main: 0,
          type_load: "0",
          type_load_main: "0",
          child_uuid: "",
          mark_load: ""),
    ];
  }

  static Item getItemFromJson(Map<String, dynamic> element) {
    DateTime date =
        DateTime.tryParse(element["date_overdue"] ?? "") ?? DateTime(1, 1, 1);
    DateFormat _format = DateFormat("dd.MM.yyyy");
    String dateOverdue = _format.format(date);
    return Item(
        id: element['uuid'] ?? "",
        uuid: element['uuid'] ?? "",
        name: element['name'] ?? "",
        price: double.parse((element['price'] ?? 0).toString()),
        currentCount: element['quantity_choice'] ?? 0,
        date_overdue: dateOverdue ?? "",
        date_overdue_real: element["date_overdue"] ?? "",
        quantiry_per_pack:
            int.parse((element['quantity_per_pack'] ?? 0).toString()),
        unit: element['unit'] ?? "",
        remainder: double.parse((element['remainder'] ?? 0).toString()),
        fabricator: element['fabricator'] ?? "",
        type_load_main: element['type_load_main'] ?? "",
        currentCount_free: element['quantity_free_choice'] ?? 0,
        group: element['group'] ?? 0,
        child_uuid: element['child_uuid'] ?? "",
        group_main: element['group_main'] ?? 0,
        type_load: element['type_load'] ?? "",
        discount: element['discount'] ?? 0,
        discount_best: element['discount_best'] ?? false,
        mark_load: element['mark_load_main'] ?? "");
  }

  static Map<String, dynamic> getDefaultBody() {
    HiveLocal _hiveLocal = HiveLocal();
    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      return {"message": "Error user is not initialized", "status": false};
    }

    return {
      "username": user.name,
      "token": user.token,
      "imei": user.imei,
      "type_device": user.type_device,
    };
  }

  static Map<String, String>? getDefaultAuth() {
    return {'Authorization': basicAuth!};
  }

  static Map<String, dynamic> createFilterRequest(
      String _filterType, String group) {
    switch (_filterType) {
      case 'Акция':
        return {'filter_type_load': 'promotion'};
      case 'Ходовой':
        return {'filter_type_load': 'running'};
      case 'Нагрузка':
        return {'filter_type_load': 'load'};
      case 'Ассортиментный':
        return {'filter_type_load': 'assorted'};
      default:
        return {};
    }
    // return {
    //   if (_filterType == 'Акция' || _filterType == 'Нагрузочный')
    //     "filter_type_load": _filterType == 'Акция' ? 'promotion' : 'load'
    //   else
    //     "filter_type_load_no_main": _filterType == 'Нагрузка' ? 'load' : '',
    //   if (_filterType == 'Нагрузка')
    //     "filter_group_no_main": group == "" ? "" : int.parse(group)
    //   else
    //     "filter_group": group == "" ? "" : int.parse(group)
    // };
  }

  static Future<String> getSearchText() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString("search")!;
  }

  static Future<bool> setSearchText(String text) async {
    var prefs = await SharedPreferences.getInstance();
    return await prefs.setString("search", text);
  }

  static Future<String> getFilePath(uniqueFileName) async {
    String path = '';
    Directory dir = await getApplicationDocumentsDirectory();
    path = '${dir.path}/$uniqueFileName';
    return path;
  }

  static String getCurrentDateString() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  static bool checkHowManyDaysHavePassed_cart() {
    String dateString = SharedPrefs().cartSync;
    DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(dateString);
    DateTime currentDate = DateTime.now();
    Duration difference = currentDate.difference(parsedDate);
    int daysPassed = difference.inDays;
    return daysPassed >= 5 ? true : false;
  }

  static bool checkHowManyDaysHavePassed_news() {
    String dateString = SharedPrefs().newsSync;
    DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(dateString);
    DateTime currentDate = DateTime.now();
    Duration difference = currentDate.difference(parsedDate);
    int daysPassed = difference.inDays;
    return daysPassed >= 5 ? true : false;
  }

  static String getNormalDate(String _date) {
    DateTime date = DateTime.tryParse(_date) ?? DateTime(1, 1, 1);
    DateFormat _format = DateFormat("dd.MM.yyyy");
    String dateOverdue = _format.format(date);
    return dateOverdue;
  }

  static String getNormalFormatPrice(value) {
    return NumberFormat.decimalPattern('ru-Ru').format(value);
  }
}
