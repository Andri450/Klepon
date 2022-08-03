// To parse this JSON data, do
//
//     final beritaModel = beritaModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<BeritaModel> beritaModelFromJson(String str) => List<BeritaModel>.from(
    json.decode(str).map((x) => BeritaModel.fromJson(x)));

String beritaModelToJson(List<BeritaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BeritaModel {
  BeritaModel({
    required this.beritaId,
    required this.judul,
    required this.tanggalBerita,
    required this.foto,
    required this.sumber,
  });

  final String beritaId;
  final String judul;
  final DateTime tanggalBerita;
  final String foto;
  final String sumber;

  factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
        beritaId: json["beritaId"],
        judul: json["judul"],
        tanggalBerita: DateTime.parse(json["tanggalBerita"]),
        foto: json["foto"],
        sumber: json["sumber"],
      );

  Map<String, dynamic> toJson() => {
        "beritaId": beritaId,
        "judul": judul,
        "tanggalBerita":
            "${tanggalBerita.year.toString().padLeft(4, '0')}-${tanggalBerita.month.toString().padLeft(2, '0')}-${tanggalBerita.day.toString().padLeft(2, '0')}",
        "foto": foto,
        "sumber": sumber,
      };
}
