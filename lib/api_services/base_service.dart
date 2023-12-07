import 'dart:convert';

import 'package:api/api_urls/api_urls.dart';
import 'package:http/http.dart' as http;

class BaseService {
  Future postHttp({
    required String api,
    required Map<String, dynamic> data,
  }) async {
    final url = ApiUrls.baseurl + api;
    print(url);
    final body = jsonEncode(data);
    final response = await http.post(
      Uri.parse(url),
      headers: {'content-type': 'application/json'},
      body: body,
    );
    return response;
  }
}
