import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleponapps/screen/ResetPassword1.dart';
import '../controller/loginController.dart';
import '../utils/colors.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final LoginController c = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final ptop = MediaQuery.of(context).padding.top;
    // final lebarBody = MediaQuery.of(context).size.width - 80;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ptop + 150,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Login',
              style: GetTheme().judulprimary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              style: GetTheme().subTitleHeading,
              controller: c.uname,
              decoration: InputDecoration(
                fillColor: GetTheme().primaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                labelText: 'Email',
                labelStyle: GetTheme().subTitleHeading,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              style: GetTheme().subTitleHeading,
              controller: c.pass,
              decoration: InputDecoration(
                fillColor: GetTheme().primaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                labelText: 'Password',
                labelStyle: GetTheme().subTitleHeading,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => ResetPassword1());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 35, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lupa Password?',
                    style: TextStyle(color: GetTheme().primaryColor),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                c.kirim();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(330, 60),
                primary: GetTheme().primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Masuk',
                style: GetTheme().subTitleHeading,
              ),
            ),
          )
        ],
      ),
    );
  }
}
