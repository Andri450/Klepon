// To parse this JSON data, do
//
//     final adminLoginModel = adminLoginModelFromJson(jsonString);
// ignore_for_file: file_names

import 'dart:convert';

List<AdminLoginModel> adminLoginModelFromJson(String str) =>
    List<AdminLoginModel>.from(
        json.decode(str).map((x) => AdminLoginModel.fromJson(x)));

String adminLoginModelToJson(List<AdminLoginModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminLoginModel {
  AdminLoginModel({
    required this.adminId,
    required this.email,
    required this.password,
    required this.nama,
  });

  final String adminId;
  final String email;
  final String password;
  final String nama;

  factory AdminLoginModel.fromJson(Map<String, dynamic> json) =>
      AdminLoginModel(
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
