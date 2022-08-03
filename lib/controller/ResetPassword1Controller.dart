// ignore_for_file: file_names, deprecated_member_use, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleponapps/screen/ResetPassword2.dart';
import '../services/http_services.dart';

class ResetPassword1Controller extends GetxController {
  late TextEditingController email;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  void kirim() async {
    try {
      var result = await HttpService.RequestOtp(
        email.text,
      );
      log(result.toString());
      // if (result.toString() == 'berhasil') {
      //   log(result.toString());
      // }
    } finally {
      Get.to(
        () => ResetPassword2(
          email: email.text,
        ),
      );
    }
  }

  @override
  void onClose() {}
}
