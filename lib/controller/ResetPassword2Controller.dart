// ignore_for_file: file_names, deprecated_member_use, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleponapps/screen/ResetPassword3.dart';
import 'package:kleponapps/screen/login.dart';
import '../services/http_services.dart';

class ResetPassword2Controller extends GetxController {
  late TextEditingController otp;

  @override
  void onInit() {
    otp = TextEditingController();
    super.onInit();
  }

  void kirim(em) async {
    try {
      var result = await HttpService.KonfirOtp(
        em,
        otp.text,
      );
      log(result.toString());
      if (result.toString() == 'berhasil') {
        Get.to(() => ResetPassword3(email: em));
      } else {
        Get.to(() => Login());
      }
    } finally {}
  }

  @override
  void onClose() {}
}
