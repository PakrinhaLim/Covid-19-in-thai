import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final url = 'https://covid19.th-stat.com/api/open/today';

  NetworkHelper();

  Map<String, String> headers = {
    "Content-type": "application/x-www-form-urlencoded"
  };

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResp = jsonDecode(response.body);
      // print(decodedResp);
      return decodedResp;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
