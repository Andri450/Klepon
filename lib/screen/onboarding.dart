// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleponapps/screen/Dasboard.dart';
import '../controller/onboarding_controller.dart';
import '../screen/login.dart';
import '../utils/colors.dart';

class Onboarding extends StatelessWidget {
  Onboarding({Key? key}) : super(key: key);

  final OnboardingController c = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final ptop = MediaQuery.of(context).padding.top;
    final lebarBody = MediaQuery.of(context).size.width - 80;
    // final tinggiBody = MediaQuery.of(context).size.height - ptop;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ptop + 30,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              enlargeCenterPage: true,
              initialPage: 0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                c.indexCarousel.value = index;
              },
            ),
            items: c.listKonten.map(
              (i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: 180,
                      child: Container(
                        // height: 200,
                        // width: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/foto/logo.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ).toList(),
            carouselController: c.buttonCarouselController,
          ),
          // Center(
          //   child: SizedBox(
          //     height: 80,
          //     width: 300,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 1,
          //       shrinkWrap: true,
          //       itemBuilder: (context, i) {
          //         return Container(
          //           width: 8.0,
          //           height: 8.0,
          //           margin: const EdgeInsets.symmetric(horizontal: 3.0),
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: i == c.indexCarousel.value
          //                 ? GetTheme().primaryColor
          //                 : GetTheme().secondaryColor,
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    c.listKonten[c.indexCarousel.value]['judul'].toString(),
                    textAlign: TextAlign.left,
                    style: GetTheme().titleHeadingOnBoarding,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.only(
                          left: 3.0,
                          right: 3.0,
                          top: 4,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: GetTheme().primaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 290,
                        child: AutoSizeText(
                          c.listKonten[c.indexCarousel.value]['isi'].toString(),
                          textAlign: TextAlign.left,
                          maxLines: 5,
                          style: GetTheme().subTitleHeadingOnboard,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: Container(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => Login());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                width: lebarBody * .4,
                decoration: BoxDecoration(
                  color: GetTheme().secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Obx(
              () => c.indexCarousel.value != (c.listKonten.length - 1)
                  ? GestureDetector(
                      onTap: () {
                        c.buttonCarouselController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        width: lebarBody * .5,
                        decoration: BoxDecoration(
                          color: GetTheme().primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        // Get.to(() => PageViews());
                      },
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => Dashboard());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 18,
                          ),
                          width: lebarBody * .5,
                          decoration: BoxDecoration(
                            color: GetTheme().primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Baca Berita',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
