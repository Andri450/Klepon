// ignore_for_file: file_names

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/DashboardController.dart';
import '../utils/colors.dart';

import 'MenuBerita.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final DashboardController c = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: c.pageController,
          onPageChanged: (index) {
            c.currentIndex.value = index;
          },
          children: <Widget>[
            MenuBerita(),
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: c.currentIndex.value,
        onItemSelected: (index) {
          c.currentIndex.value = 0;
          c.pageController.jumpToPage(0);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            activeColor: GetTheme().primaryColor,
            inactiveColor: Colors.black,
            title: const Text('Kliping List'),
            icon: const Icon(Icons.newspaper),
          ),
          BottomNavyBarItem(
            activeColor: GetTheme().primaryColor,
            inactiveColor: Colors.white,
            title: const Text(''),
            icon: const Icon(Icons.exposure_zero),
          ),
        ],
      ),
    );
  }
}
