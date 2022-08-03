// ignore_for_file: file_names, unrelated_type_equality_checks, non_constant_identifier_names, invalid_use_of_protected_member

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/http_services.dart';

class AdminDashboardController extends GetxController {
  var adminList = [].obs;
  var berita = [].obs;
  var sumberBeritadat = [].obs;
  final valsumber = "1".obs;
  TextEditingController dateInput = TextEditingController();
  var currentIndex = 0.obs;
  late PageController pageController;
  var tgl = 'Tanggal Berita'.obs;
  var StatusBerita = 'loading'.obs;

  @override
  void onInit() {
    dateInput.text = "Tanggal Berita";
    getSumberBerita();
    getBerita();
    getAdminList();
    super.onInit();
    pageController = PageController();
  }

  void getSumberBerita() async {
    try {
      var result = await HttpService.SumberBerita();
      sumberBeritadat.value = result;
    } finally {
      // inspect(sumberBeritadat);
    }
  }

  void getAdminList() async {
    try {
      adminList.value = [];
      var result = await HttpService.getAdminList();
      adminList.value = result;
    } finally {
      inspect(adminList.value);
    }
  }

  void getBerita() async {
    try {
      StatusBerita.value = 'loading';
      berita.value = [];
      var result = await HttpService.getBerita();
      berita.value = result;
    } finally {
      if (berita.isEmpty) {
        StatusBerita.value = 'kosong';
      } else {
        StatusBerita.value = 'isi';
      }
      log(StatusBerita.value);
    }
  }

  void getBeritaFilter() async {
    try {
      StatusBerita.value = 'loading';
      berita.value = [];

      if (valsumber.value != '1') {
        if (tgl.value != 'Tanggal Berita') {
          log('semua');
          log(valsumber.value);
          var result = await HttpService.getBeritaFilterSemua(
              tgl.value, valsumber.value);
          berita.value = result;
        } else {
          log('sumber');
          var result = await HttpService.getBeritaFilterSumber(valsumber.value);
          berita.value = result;
        }
      } else {
        log('tgl');
        var result = await HttpService.getBeritaFilterTgl(tgl.value);
        berita.value = result;
      }

      if (valsumber.value == '1' && tgl.value == 'Tanggal Berita') {
        getBerita();
      }
    } finally {
      if (berita.isEmpty) {
        StatusBerita.value = 'kosong';
      } else {
        StatusBerita.value = 'isi';
      }
      log(StatusBerita.value);
    }
  }

  void HapusBerita(id) async {
    try {
      var result = await HttpService.HapusBerita(id);
      log(result.toString());
    } finally {
      resetFilter();
      getBerita();
    }
  }

  void HapusAdmin(id) async {
    try {
      var result = await HttpService.HapusAdmin(id);
      log(result.toString());
    } finally {
      getAdminList();
    }
  }

  void gantiTgl() {
    tgl.value = dateInput.text;
  }

  void resetFilter() {
    tgl.value = 'Tanggal Berita';
    valsumber.value = '1';
  }

  @override
  void onClose() {
    pageController.dispose();
  }
}
