import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/welcome_controller.dart';
import '../utils/colors.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  final WelcomeController c = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GetTheme().themeColors('primaryColor'),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * .13,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: GetTheme().primaryColor,
                borderRadius: const BorderRadius.vertical(
                    bottom: Radius.elliptical(200, 150)),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/foto/logo.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Text('Klepon', style: GetTheme().judulWelcome),
                const SizedBox(height: 10),
                const Text('Kliping Online'),
                const Text('Kabupaten Pringsewu'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
