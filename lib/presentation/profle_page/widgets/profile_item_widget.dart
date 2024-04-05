import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../domain/models/user.dart';
import '../../../utils/notifications.dart';

class ProfileListItem extends StatelessWidget {
  late bool isAuth;
  late dynamic func;
  late String text;

  ProfileListItem(
    bool this.isAuth,
    dynamic this.func,
    String this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // if (!isAuth) {
            //   showToastMessage_auth(
            //       fToast, context, 'Необходимо войти в приложение');
            //   return;
            // }

            isAuth
                ? func()
                : showAlert(context, "Доступ запрещен", AlertType.error);
          },
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
