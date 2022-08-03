// ignore_for_file: file_names, avoid_print, unrelated_type_equality_checks

import 'dart:developer';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/InputBeritaController.dart';
import '../utils/colors.dart';
import 'package:intl/intl.dart';

class TambahBerita extends StatelessWidget {
  TambahBerita({Key? key}) : super(key: key);

  final InputBeritaController c = Get.put(InputBeritaController());

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
              'Input Kliping',
              style: GetTheme().judulprimary,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              padding: const EdgeInsets.only(
                left: 10,
                top: 5,
                bottom: 5,
                right: 22,
              ),
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
              child: DropdownButtonHideUnderline(
                child: Obx(
                  () => c.sumberBeritadat.isNotEmpty
                      ? DropdownButton(
                          isExpanded: true,
                          style: c.valsumber == '1'
                              ? const TextStyle(color: Colors.black38)
                              : const TextStyle(color: Colors.black),
                          hint: const Text('Sumber Berita'),
                          items: c.sumberBeritadat.map((value) {
                            return DropdownMenuItem(
                              value: value.idSumber,
                              child: value.idSumber == '1'
                                  ? AutoSizeText(
                                      value.sumber,
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sumber Berita',
                                          textAlign: TextAlign.left,
                                          style:
                                              TextStyle(color: Colors.black38),
                                        ),
                                        const SizedBox(height: 4),
                                        AutoSizeText(
                                          value.sumber,
                                        )
                                      ],
                                    ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            log(value.toString());
                            c.valsumber.value = value.toString();
                          },
                          value: c.valsumber.value,
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
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
                controller: c.judul,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Judul Berita',
                  labelStyle: TextStyle(color: Colors.black38),
                ),
              ),
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
                decoration: const InputDecoration(
                  labelText: 'Tanggal Berita',
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.black38),
                  suffixIcon: Icon(Icons.calendar_month),
                ),
                readOnly: true,
                controller: c.dateInput,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16

                    c.dateInput.text =
                        formattedDate; //set output date to TextField value.

                  } else {}
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.photo_camera_outlined,
                  size: 60,
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        child: AutoSizeText(
                          'Ambil Foto Berita',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 2),
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: 140,
                        child: AutoSizeText(
                          '*Foto Berita Tentang Pringsewu.',
                          maxLines: 3,
                          style: TextStyle(fontSize: 1),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    c.pickImage();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.amber,
                      shape: BoxShape.rectangle,
                    ),
                    child: const Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => c.gambar.value
                ? Center(
                    child: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      // padding:
                      //     const EdgeInsets.symmetric(vertical: 5),
                      height: 200,
                      width: 300,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Image.file(
                          File(c.imageFile.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
          const SizedBox(height: 20),
          Obx(
            () => c.gambar.value
                ? Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        c.uploads();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        primary: GetTheme().primaryColor,
                      ),
                      icon: const Icon(Icons.upload_file),
                      label: const Text('Kirim Berita'),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
