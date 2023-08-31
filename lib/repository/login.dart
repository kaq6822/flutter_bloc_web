import 'dart:convert';

import 'package:flutter_bloc_web/model/login.dart';
import 'package:http/http.dart';

class LoginRepository {
  String url = "http://localhost:1323/login";

  login(LoginReqModel loginReqModel) async {
    try {
      var response = await post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(loginReqModel.toJson()));
      if (response.statusCode == 200) {
        return LoginResModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
