// To parse this JSON data, do
//
//     final ghg = ghgFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Ghg {
  Ghg();

  Future<dynamic> getGhgLatest(double lat, double lon) async {
    var url = Uri.parse('${dotenv.env['baseUrlGhg']}');
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'x-api-key': '${dotenv.env['apiKey']}'
    };
    var response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      var body = response.body;
      var decoded = jsonDecode(body);

      return decoded;
    } else {
      return null;
    }
  }
}
