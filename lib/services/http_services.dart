// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kleponapps/models/AdminListModel.dart';
import '../models/AdminLoginModel.dart';
import '../models/BeritaModel.dart';
import '../models/SumberBeritaModel.dart';

// List<NewsPosts> newsPostsFromJson(http.Response response) {
//   return [
//     if (response.statusCode == 200)

//       return newsPostsFromJson(data);

//   ];
// }

class HttpService {
  static Future<List<AdminLoginModel>> login() async {
    var response = await http
        .get(Uri.parse("https://kleponapi.000webhostapp.com/index.php/Logins"));
    if (response.statusCode == 200) {
      var data = response.body;
      return adminLoginModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future kirimLogin(String uname, String pass) async {
    var response = await http.post(
      Uri.parse('https://kleponapi.000webhostapp.com/index.php/Logins'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': uname, 'pass': pass}),
    );

    if (response.statusCode == 200) {
      var data = response.body;
      var jumlahData = jsonDecode(response.body).length;
      if (jumlahData >= 1) {
        return adminLoginModelFromJson(data);
      } else {
        return 'gagal';
      }
    } else {
      return response.statusCode;
    }
  }

  static Future<List<SumberBeritaModel>> SumberBerita() async {
    var response = await http.get(
      Uri.parse("https://kleponapi.000webhostapp.com/index.php/SumberBerita"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return sumberBeritaModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<AdminListModel>> getAdminList() async {
    var response = await http.get(
      Uri.parse("https://kleponapi.000webhostapp.com/index.php/GetAdmin"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return adminListModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<BeritaModel>> getBerita() async {
    var response = await http.get(
      Uri.parse("https://kleponapi.000webhostapp.com/index.php/GetBerita"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return beritaModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<BeritaModel>> getBeritaFilterSemua(tgl, sumber) async {
    var response = await http.get(
      Uri.parse(
          "https://kleponapi.000webhostapp.com/index.php/GetBerita?tgl=$tgl&sumber=$sumber"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return beritaModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<BeritaModel>> getBeritaFilterSumber(sumber) async {
    var response = await http.get(
      Uri.parse(
          "https://kleponapi.000webhostapp.com/index.php/GetBerita?sumber=$sumber"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return beritaModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<BeritaModel>> getBeritaFilterTgl(tgl) async {
    var response = await http.get(
      Uri.parse(
          "https://kleponapi.000webhostapp.com/index.php/GetBerita?tgl=$tgl"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return beritaModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  // static Future<String?> uploadBerita(filepath) async {
  //   var request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse(
  //       "https://kleponapi.000webhostapp.com/index.php/uploadBerita",
  //     ),
  //   );
  //   request.files.add(http.MultipartFile.fromBytes(
  //       'picture', File(filepath).readAsBytesSync(),
  //       filename: filepath.split("/").last));
  //   var res = await request.send();
  //   return res.reasonPhrase;
  // }

  static Future<String?> uploadBerita(filepath, idSumber, judul, tgl) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://kleponapi.000webhostapp.com/index.php/uploadBerita'),
    );
    request.fields['idSumber'] = idSumber;
    request.fields['judul'] = judul;
    request.fields['tgl'] = tgl;
    request.files.add(await http.MultipartFile.fromPath('foto', filepath));
    var res = await request.send();
    var responsed = await http.Response.fromStream(res);
    var respStr = responsed.body.toString();

    return respStr;
  }

  // static fetchTes() async {
  //   var response = await http
  //       .get(Uri.parse("https://kleponapi.000webhostapp.com/index.php/coba"));
  //   var data = response.body;
  //   return jsonEncode(data);
  // }

  static Future InputAdmin(String nama, String email, String password) async {
    var response = await http.post(
      Uri.parse('https://kleponapi.000webhostapp.com/index.php/InputAdmin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'email': email, 'password': password, 'nama': nama}),
    );

    if (response.statusCode == 200) {
      var data = response.body;
      if (data == 'berhasil') {
        return 'berhasil';
      } else {
        return 'gagal';
      }
    } else {
      return response.statusCode;
    }
  }

  static HapusBerita(id) async {
    var response = await http.get(
      Uri.parse(
          "https://kleponapi.000webhostapp.com/index.php/HapusBerita?id=$id"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static HapusAdmin(id) async {
    var response = await http.get(
      Uri.parse(
          "https://kleponapi.000webhostapp.com/index.php/HapusAdmin?id=$id"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static RequestOtp(email) async {
    var response = await http.get(
      Uri.parse(
          "http://kleponapi.000webhostapp.com/index.php/SendOtp?email=$email"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static KonfirOtp(email, otp) async {
    var response = await http.get(
      Uri.parse(
          "http://kleponapi.000webhostapp.com/index.php/KonfirOtp?email=$email&otp=$otp"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static GantiPassword(email, pass) async {
    var response = await http.get(
      Uri.parse(
          "http://kleponapi.000webhostapp.com/index.php/GantiPassword?email=$email&pass=$pass"),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }
}


// https://stackoverflow.com/questions/59114243/flutter-best-way-to-request-multiple-apis-simultaneously