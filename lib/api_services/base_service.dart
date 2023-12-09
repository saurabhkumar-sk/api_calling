import 'dart:convert';

import 'package:api/api_urls/api_urls.dart';
import 'package:http/http.dart' as http;

class BaseService {
  // get Api
  Future<http.Response> getHttp(String api) async {
    final url = ApiUrls.baseurl + api;
    print(url);

    final response = await http.get(
      Uri.parse(url),
      headers: {'content-Type': 'application/json'},
    );
    return response;
  }

  //post APi

  Future postHttp(
      {required String api, required Map<String, dynamic> data}) async {
    final url = ApiUrls.baseurl + api;
    final body = jsonEncode(data);
    final response = await http.post(
      Uri.parse(url),
      headers: {'content-type': 'application/json'},
      body: body,
    );
    return response;
  }
}
