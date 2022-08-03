// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnOffController extends GetxController {
  RxBool isSwitched = false.obs;
  var textValue = 'Switch is OFF'.obs;

  void toggleSwitch(bool value) {
    if (isSwitched.value == false) {
      isSwitched.value = true;
      textValue.value = 'Switch Button is ON';
      Get.changeTheme(ThemeData.dark());
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      isSwitched.value = false;
      Get.changeTheme(ThemeData.light());
      textValue.value = 'Switch Button is OFF';
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }
}
