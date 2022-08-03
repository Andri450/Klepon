// ignore_for_file: file_names, deprecated_member_use, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleponapps/screen/login.dart';
import '../services/http_services.dart';

class ResetPassword3Controller extends GetxController {
  late TextEditingController pass;

  @override
  void onInit() {
    pass = TextEditingController();
    super.onInit();
  }

  void kirim(em) async {
    try {
      var result = await HttpService.GantiPassword(
        em,
        pass.text,
      );
      log(result.toString());
    } finally {
      Get.to(() => Login());
    }
  }

  @override
  void onClose() {}
}
