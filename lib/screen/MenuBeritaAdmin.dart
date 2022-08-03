// ignore_for_file: file_names, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kleponapps/screen/DetailKliping.dart';
import 'package:kleponapps/screen/TambahBerita.dart';
import '../utils/colors.dart';

import '../controller/AdminDashboardController.dart';

class MenuBeritaAdmin extends StatelessWidget {
  MenuBeritaAdmin({Key? key}) : super(key: key);

  final AdminDashboardController c = Get.put(AdminDashboardController());

  @override
  Widget build(BuildContext context) {
    final ptop = MediaQuery.of(context).padding.top;
    final lebarBody = MediaQuery.of(context).size.width - 80;
    final tinggiBody = MediaQuery.of(context).size.height - ptop;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ptop + 40,
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           Get.to(() => TambahBerita());
          //         },
          //         child: const Text('Tambah'),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('List Berita', style: GetTheme().judulprimary),
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                // style: GetTheme().titleHeading,
                                hint: const Text('Sumber Berita'),
                                items: c.sumberBeritadat.map((value) {
                                  return DropdownMenuItem(
                                    value: value.idSumber,
                                    child: AutoSizeText(
                                      value.sumber,
                                      textAlign: TextAlign.center,
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
                  const SizedBox(width: 16),
                  GestureDetector(
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
                        c.gantiTgl();
                      } else {}
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      width: 140,
                      height: 60,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () =>
                                Text(c.tgl.value, textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    c.getBeritaFilter();
                  },
                  child: Container(
                    width: 276,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: GetTheme().primaryColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: Text(
                      'Fliter',
                      textAlign: TextAlign.center,
                      style: GetTheme().subTitleHeading,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    c.resetFilter();
                    c.getBerita();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: GetTheme().dangerColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: const Icon(Icons.restore, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Obx(
                  () => (c.StatusBerita.value == 'isi')
                      ? SizedBox(
                          height: tinggiBody * .64,
                          child: ListView.builder(
                            // shrinkWrap: true,
                            itemCount: c.berita.length,
                            itemBuilder: (BuildContext context, int i) {
                              var dats = c.berita[i];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailKliping(
                                            data: dats,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: i != 0
                                          ? const EdgeInsets.all(18)
                                          : const EdgeInsets.only(
                                              left: 18,
                                              right: 18,
                                              bottom: 18,
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
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.zero,
                                            padding: EdgeInsets.zero,
                                            // padding:
                                            //     const EdgeInsets.symmetric(vertical: 5),
                                            height: 200,
                                            width: lebarBody * 2,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              child: Image.network(
                                                'https://kleponapi.000webhostapp.com/images/' +
                                                    dats.foto,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 20,
                                              bottom: 0,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: 186,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AutoSizeText(
                                                        dats.judul,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GetTheme()
                                                            .titleHeadingBerita,
                                                      ),
                                                      AutoSizeText(
                                                        dats.sumber,
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GetTheme()
                                                            .subTitleHeadingOnboard,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    AutoSizeText(
                                                      DateFormat.yMMMEd()
                                                          .format(dats
                                                              .tanggalBerita)
                                                          .toString(),
                                                      maxLines: 1,
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                c.HapusBerita(dats.beritaId);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                primary: GetTheme().dangerColor,
                                              ),
                                              icon: const Icon(Icons.delete),
                                              label: const Text('Hapus'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : (c.StatusBerita.value == 'loading')
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  SizedBox(height: 50),
                                  CircularProgressIndicator(),
                                ],
                              ),
                            )
                          : const Center(
                              child: Text('Data Tidak Ditemukan'),
                            ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => TambahBerita());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
