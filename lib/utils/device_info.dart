import 'package:device_information/device_information.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class DeviceInfo {
  getImeiDevice() async => await DeviceInformation.deviceIMEINumber;
  getTypeDevice() {
    if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "Ios";
    } else if (kIsWeb) {
      return "web";
    }
  }
}
