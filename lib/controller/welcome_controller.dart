// ignore_for_file: file_names

import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';

import '../screen/onboarding.dart';

class WelcomeController extends GetxController {
  var counter = 0.obs;

  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    hitungMundur();
  }

  void hitungMundur() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (counter >= 3) {
          timer.cancel();
          Get.to(() => Onboarding());
        } else {
          counter++;
          log(counter.toString());
        }
      },
    );
  }
}
