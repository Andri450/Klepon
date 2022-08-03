
import 'package:get/get.dart';



class PageViewsController extends GetxController{
  static var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}

