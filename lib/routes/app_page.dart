import 'package:get/get.dart';

import './/routes/route.dart';
import './/screen/welcome.dart';
import './/screen/onboarding.dart';

class AppPage {
  static final pages = [
    GetPage(name: RouteName.welcome, page: () => Welcome()),
    GetPage(name: RouteName.onboarding, page: () => Onboarding()),
  ];
}
