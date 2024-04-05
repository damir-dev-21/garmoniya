import 'package:garmoniya_pharm/utils/main_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;
  init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String get searchText => _sharedPrefs.getString("search") ?? "";
  String get username => _sharedPrefs.getString("username") ?? "";
  String get password => _sharedPrefs.getString("password") ?? "";
  int get cartCount => _sharedPrefs.getInt("cartCount") ?? 0;
  int get itemsCount => _sharedPrefs.getInt("itemsCount") ?? 0;
  String get cartSync =>
      _sharedPrefs.getString("cartSync") ?? MainService.getCurrentDateString();
  String get newsSync => _sharedPrefs.getString("newsSync") ?? "";
  String get locale => _sharedPrefs.getString("locale") ?? "ru";

  set searchText(String value) {
    _sharedPrefs.setString("search", value);
  }

  set username(String value) {
    _sharedPrefs.setString("username", value);
  }

  set password(String value) {
    _sharedPrefs.setString("password", value);
  }

  set cartCount(int value) {
    _sharedPrefs.setInt("cartCount", value);
  }

  set itemsCount(int value) {
    _sharedPrefs.setInt("itemsCount", value);
  }

  set cartSync(String value) {
    _sharedPrefs.setString("cartSync", value);
  }

  set newsSync(String value) {
    _sharedPrefs.setString("newsSync", value);
  }

  set locale(String value) {
    _sharedPrefs.setString("locale", value);
  }
}
