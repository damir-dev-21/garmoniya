import 'package:flutter/material.dart';

class DialogState {
  bool isOpen(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
}
