// ignore_for_file: file_names, prefer_typing_uninitialized_variables, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kleponapps/utils/colors.dart';

class DetailKliping extends StatelessWidget {
  final data;
  // ignore: use_key_in_widget_constructors
  const DetailKliping({required this.data});

  @override
  Widget build(BuildContext context) {
    final ptop = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: ptop + 70),
          Center(child: Text(data.judul, style: GetTheme().judulprimary)),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.sumber),
                const SizedBox(width: 16),
                Text(DateFormat.yMMMEd().format(data.tanggalBerita).toString()),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            // padding:
            //     const EdgeInsets.symmetric(vertical: 5),
            height: 400,
            width: 300,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.network(
                'https://kleponapi.000webhostapp.com/images/' + data.foto,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
