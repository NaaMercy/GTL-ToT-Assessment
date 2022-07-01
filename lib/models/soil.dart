// To parse this JSON data, do
//
//     final soil = soilFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Soil {
  Soil();

  Future<dynamic> getSoilLatest(double lat, double lon) async {
    var url = Uri.parse('${dotenv.env['baseUrlSoil']}lat=$lat&lng=$lon');
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
