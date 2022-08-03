// ignore_for_file: file_names, deprecated_member_use, avoid_print

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/AdminDashboardController.dart';
import '../services/http_services.dart';
import 'dart:async';

class InputBeritaController extends GetxController {
  var sumberBeritadat = [].obs;

  final valsumber = "1".obs;
  TextEditingController dateInput = TextEditingController();
  late TextEditingController judul;

  late Future<File> file;
  String status = '';
  late String base64Image;
  late File tmpFile;

  var tes = ''.obs;

  final AdminDashboardController c = Get.find<AdminDashboardController>();

  @override
  void onInit() {
    getSumberBerita();
    dateInput.text = "";
    judul = TextEditingController();
    super.onInit();
  }

  late PickedFile imageFile;
  final ImagePicker picker = ImagePicker();
  var gambar = false.obs;

  void pickImage() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      // setState(() {
      //   imageFile = pickedFile!;
      // });
      gambar.value = false;
      imageFile = pickedFile!;
      gambar.value = true;
      // inspect(imageFile);
    } catch (e) {
      print("Image picker error $e");
    }
  }

  void uploads() async {
    try {
      var result = await HttpService.uploadBerita(
        imageFile.path,
        valsumber.value,
        judul.text,
        dateInput.text,
      );
      log(result.toString());
      // if (result.toString() == 'berhasil') {
      //   log(result.toString());
      // }
    } finally {
      c.getBerita();
      Get.back();
    }
  }

  void getSumberBerita() async {
    try {
      var result = await HttpService.SumberBerita();
      // inspect(result[0]);
      sumberBeritadat.value = result;
    } finally {
      // inspect(sumberBeritadat);
    }
  }

  @override
  void onClose() {}
}
