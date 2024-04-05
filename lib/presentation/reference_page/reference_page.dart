import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:garmoniya_pharm/data/config/colors.dart';
import 'package:garmoniya_pharm/data/config/urls.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/local/hive_local.dart';
import '../../domain/models/user.dart';
import '../../utils/notifications.dart';
import '../../utils/shared_prefs.dart';

class ReferencePage extends StatefulWidget {
  ReferencePage({Key? key}) : super(key: key);

  @override
  State<ReferencePage> createState() => _ReferencePageState();
}

class _ReferencePageState extends State<ReferencePage> {
  // late FToast fToast;
  String theme = "";
  String content = "";
  String base64 = "";
  String ext = "";
  String fileText = "Файл!";
  File? file;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // fToast = FToast();
    // fToast.init(context);
  }

  Future<Map<String, dynamic>> sendOpinion() async {
    HiveLocal _hiveLocal = HiveLocal();
    Map<String, dynamic> _opinion = {
      "title": theme,
      "text": content,
      "file_base64": base64,
      "ext": '.jpg'
    };
    setState(() {
      _isLoading = true;
    });
    try {
      User? user = _hiveLocal.getUserFromDb();
      if (user == null) {
        setState(() {
          _isLoading = false;
        });
        return {"message": "Error user is not initialized", "status": false};
      }
      final responce = await http.post(Uri.parse(urlReference),
          headers: {'Authorization': basicAuth!},
          body: jsonEncode({
            "username": user.name,
            "token": user.token,
            "imei": user.imei,
            ..._opinion
          }));
      String body = utf8.decode(responce.bodyBytes);
      if (responce.statusCode == 200) {
        final extractedData = json.decode(body) as Map<String, dynamic>;
        if (extractedData['is_auth']) {
          setState(() {
            _isLoading = false;
            theme = "";
            content = "";
          });
          return {
            "status": true,
            "isAuth": extractedData['is_auth'],
            "message": extractedData['message'] != null
                ? extractedData['message'][SharedPrefs().locale]
                : ""
          };
        }
        setState(() {
          _isLoading = false;
        });
        return {
          "status": false,
          "isAuth": extractedData['is_auth'],
          "message": extractedData['message']
        };
      } else {
        setState(() {
          _isLoading = false;
        });
        return {"status": false, "isAuth": true, "message": body};
      }
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
      return {"status": false, "isAuth": false, "message": e};
    }
  }

  _setPhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    List<int> bytes = imageTemp.readAsBytesSync();
    var file_base64 = base64Encode(bytes);

    setState(() {
      fileText = image.path;
      base64 = file_base64;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('${AppLocalizations.of(context)!.review}'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: mainColor,
        onPressed: () async {
          if (theme != '' && content != '') {
            final status_message = await sendOpinion();
            if (status_message['status']) {
              showAlert(context, "Сообщение отправлено", AlertType.success);
              setState(() {
                theme = '';
                content = '';
              });
            }
          } else {
            showAlert(
                context, "Произошла ошибка при отправке", AlertType.error);
          }
        },
        label: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : const Text("Отправить"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              maxLines: 1,
              onChanged: (e) {
                setState(() {
                  theme = e;
                });
              },
              decoration: InputDecoration(
                hintText: "Тема",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: textColorDark),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              maxLines: 15,
              onChanged: (e) {
                setState(() {
                  content = e;
                });
              },
              decoration: InputDecoration(
                hintText: "Текст",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: textColorDark),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                _setPhoto();
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          fileText,
                          maxLines: 1,
                        )),
                    IconButton(
                        onPressed: () {
                          _setPhoto();
                        },
                        icon: Icon(Icons.file_open))
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
