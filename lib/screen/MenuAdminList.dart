// ignore_for_file: file_names, avoid_print, prefer_interpolation_to_compose_strings

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleponapps/screen/TambahAdmin.dart';
import '../utils/colors.dart';

import '../controller/AdminDashboardController.dart';

class MenuAdminList extends StatelessWidget {
  MenuAdminList({Key? key}) : super(key: key);

  final AdminDashboardController c = Get.put(AdminDashboardController());

  @override
  Widget build(BuildContext context) {
    final ptop = MediaQuery.of(context).padding.top;
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
            child: Text('List Admin', style: GetTheme().judulprimary),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Obx(() => (c.adminList.isNotEmpty)
                    ? SizedBox(
                        height: tinggiBody * .8,
                        child: ListView.builder(
                          // shrinkWrap: true,
                          itemCount: c.adminList.length,
                          itemBuilder: (BuildContext context, int i) {
                            var dats = c.adminList[i];
                            return Container(
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
                                          width: 260,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                dats.nama,
                                                textAlign: TextAlign.left,
                                                style: GetTheme()
                                                    .titleHeadingBerita,
                                              ),
                                              AutoSizeText(
                                                dats.email,
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
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
                                            GestureDetector(
                                              onTap: () {
                                                c.HapusAdmin(dats.adminId);
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: GetTheme().dangerColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(height: 50),
                            CircularProgressIndicator(),
                          ],
                        ),
                      )),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => TambahAdmin());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
