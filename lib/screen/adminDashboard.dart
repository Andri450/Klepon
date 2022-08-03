// ignore_for_file: file_names

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleponapps/screen/MenuAdminList.dart';
import '../utils/colors.dart';

import '../controller/AdminDashboardController.dart';
import 'MenuBeritaAdmin.dart';

class AdminDashboard extends StatelessWidget {
  AdminDashboard({Key? key}) : super(key: key);

  final AdminDashboardController c = Get.put(AdminDashboardController());

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
            MenuBeritaAdmin(),
            MenuAdminList(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(
          selectedIndex: c.currentIndex.value,
          onItemSelected: (index) {
            c.currentIndex.value = index;
            c.pageController.jumpToPage(index);
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
              inactiveColor: Colors.black,
              title: const Text('Admin List'),
              icon: const Icon(Icons.group_add),
            ),
          ],
        ),
      ),
    );
  }
}
