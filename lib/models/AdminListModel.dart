// To parse this JSON data, do
//
//     final adminListModel = adminListModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<AdminListModel> adminListModelFromJson(String str) =>
    List<AdminListModel>.from(
        json.decode(str).map((x) => AdminListModel.fromJson(x)));

String adminListModelToJson(List<AdminListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminListModel {
  AdminListModel({
    required this.adminId,
    required this.email,
    required this.password,
    required this.nama,
  });

  final String adminId;
  final String email;
  final String password;
  final String nama;

  factory AdminListModel.fromJson(Map<String, dynamic> json) => AdminListModel(
        adminId: json["adminID"],
        email: json["email"],
        password: json["password"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "adminID": adminId,
        "email": email,
        "password": password,
        "nama": nama,
      };
}
