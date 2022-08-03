// ignore_for_file: file_names, avoid_print, unrelated_type_equality_checks, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ResetPassword3Controller.dart';
import '../utils/colors.dart';

class ResetPassword3 extends StatelessWidget {
  final email;
  ResetPassword3({required this.email});

  final ResetPassword3Controller c = Get.put(ResetPassword3Controller());

  @override
  Widget build(BuildContext context) {
    final ptop = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ptop + 80,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Ganti Password',
              style: GetTheme().judulprimary,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text(
              'Masukan password baru anda...',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade50,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 0.0,
                      blurRadius: 2,
                      offset: const Offset(3.0, 3.0)),
                  BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 0.0,
                      blurRadius: 2 / 2.0,
                      offset: const Offset(3.0, 3.0)),
                  const BoxShadow(
                      color: Colors.white,
                      spreadRadius: 2.0,
                      blurRadius: 2,
                      offset: Offset(-3.0, -3.0)),
                  const BoxShadow(
                      color: Colors.white,
                      spreadRadius: 2.0,
                      blurRadius: 2 / 2,
                      offset: Offset(-3.0, -3.0)),
                ],
              ),
              child: TextField(
                controller: c.pass,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Password Baru',
                  labelStyle: TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButton.icon(
              onPressed: () {
                c.kirim(email);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                primary: GetTheme().primaryColor,
              ),
              icon: const Icon(Icons.upload_file),
              label: const Text('Kirim'),
            ),
          ),
        ],
      ),
    );
  }
}
