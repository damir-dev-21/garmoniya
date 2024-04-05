import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/data/config/urls.dart';
import 'package:garmoniya_pharm/presentation/app.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/local/hive_local.dart';
import '../../domain/classes/language_constants.dart';
import '../../domain/models/user.dart';
import 'package:http/http.dart' as http;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? _lang;

  @override
  void initState() {
    super.initState();
    _lang = SharedPrefs().locale;
  }

  Future<void> _changeLanguage() async {
    HiveLocal _hiveLocal = HiveLocal();
    User? user = _hiveLocal.getUserFromDb();
    if (user == null) {
      // return {"message": "Error user is not initialized", "status": false};
    }
    final responce = await http.post(Uri.parse(urlChangeLanguage),
        headers: {'Authorization': basicAuth!},
        body: jsonEncode({
          "username": user!.name,
          "token": user.token,
          "imei": user.imei,
          "language": _lang
        }));
    String body = utf8.decode(responce.bodyBytes);
    if (responce.statusCode == 200) {
      final extractedData = json.decode(body) as Map<String, dynamic>;
      print(extractedData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: TextStyle(fontSize: 16),
                ),
                DropdownButton(
                    value: _lang,
                    items: [
                      DropdownMenuItem(
                        value: 'ru',
                        child: Text(
                          "🇷🇺 Русский",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'uz',
                        child: Text(
                          "🇺🇿 O`zbek",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                    onChanged: (e) async {
                      Locale _locale = await setLocale(e!);
                      PharmLux.setLocale(context, _locale);
                      SharedPrefs().locale = e;
                      setState(() {
                        _lang = e;
                      });
                      await _changeLanguage();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
