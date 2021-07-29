
import 'dart:convert';

import 'package:http/http.dart';
import 'package:mygithub/models/user_model.dart';

class Network {
  static String BASE = 'https://api.github.com';


  // Http APIs
  static String apiGit = '/users/SarvarFoziljonov';


  // HTTP Request

  static Future <String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    } else{
      throw Exception("No data");
    }

  }

// Params
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  // parse

  static User parsUser(String body) {
    dynamic json = jsonDecode(body);
    var data = User.fromJson(json);
    return data;
  }
}