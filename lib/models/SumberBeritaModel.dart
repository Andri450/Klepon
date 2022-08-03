// To parse this JSON data, do
//
//     final sumberBeritaModel = sumberBeritaModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<SumberBeritaModel> sumberBeritaModelFromJson(String str) =>
    List<SumberBeritaModel>.from(
        json.decode(str).map((x) => SumberBeritaModel.fromJson(x)));

String sumberBeritaModelToJson(List<SumberBeritaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SumberBeritaModel {
  SumberBeritaModel({
    required this.idSumber,
    required this.sumber,
  });

  final String idSumber;
  final String sumber;

  factory SumberBeritaModel.fromJson(Map<String, dynamic> json) =>
      SumberBeritaModel(
        idSumber: json["idSumber"],
        sumber: json["sumber"],
      );

  Map<String, dynamic> toJson() => {
        "idSumber": idSumber,
        "sumber": sumber,
      };
}
