// ignore_for_file: file_names, deprecated_member_use, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/AdminDashboardController.dart';
import '../services/http_services.dart';

class InputAdminController extends GetxController {
  late TextEditingController nama;
  late TextEditingController email;
  late TextEditingController password;

  final AdminDashboardController c = Get.find<AdminDashboardController>();

  @override
  void onInit() {
    nama = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  void uploads() async {
    try {
      var result = await HttpService.InputAdmin(
        nama.text,
        email.text,
        password.text,
      );
      log(result.toString());
      // if (result.toString() == 'berhasil') {
      //   log(result.toString());
      // }
    } finally {
      c.getAdminList();
      Get.back();
    }
  }

  @override
  void onClose() {}
}
