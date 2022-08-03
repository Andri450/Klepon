// ignore_for_file: file_names

import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  CarouselController buttonCarouselController = CarouselController();
  var indexCarousel = 0.obs;
  var total = 5.obs;
  var listKonten = [
    {
      'foto': 'foto',
      'judul': 'Welcome to Klepon',
      'isi':
          'Klepon adalah aplikasi Kliping Online Kabupaten Pringsewu, silahkan pilih login untuk admin atau pilih Baca berita untuk Guest.'
    },
  ].obs;

  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
}
