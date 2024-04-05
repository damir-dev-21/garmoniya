import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void showAlert(BuildContext context, String messageForAlert, AlertType type) {
  Alert(
    context: context,
    type: type,
    buttons: [
      DialogButton(
          child: const Text(
            "OK",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          })
    ],
    title: messageForAlert,
  ).show();
}
