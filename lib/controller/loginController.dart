// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/adminDashboard.dart';
import '../services/http_services.dart';

class LoginController extends GetxController {
  late TextEditingController uname;
  late TextEditingController pass;
  var userLogin = [].obs;
  var nama = ''.obs;
  var id = ''.obs;
  var varlogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    uname = TextEditingController();
    pass = TextEditingController();
  }

  void login() async {
    try {
      var result = await HttpService.kirimLogin(uname.text, pass.text);
      if (result == 404) {
        varlogin.value = false;
        log('Login Gagal');
      } else {
        // var dat;
        // var dat = result.user;
        // List dats = List.from(dat);
        // userLogin.value = dats;
        nama.value = result[0].nama;
        id.value = result[0].adminId;
        varlogin.value = true;
        // token.value = result.token;
        // inspect(result[0].nama);
        // inspect();
        log('Login Berhasil');
      }
    } finally {
      if (varlogin.value) {
        Get.to(() => AdminDashboard());
      }
    }
  }

  void kirim() {
    login();
  }

  @override
  void onClose() {
    uname.dispose();
    pass.dispose();
  }
}
