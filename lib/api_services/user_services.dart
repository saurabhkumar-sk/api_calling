// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:api/api_services/base_service.dart';
import 'package:api/api_urls/api_urls.dart';
import 'package:api/models/api_user_model.dart';

class UserService extends BaseService {
  //Get Api
  Future<List<ApiUserModel>?> getUserApi() async {
    try {
      final response = await getHttp(ApiUrls.user);
      print(response.body);

      final userMapList = jsonDecode(response.body);
      if (response.statusCode != 200) return null;

      List<ApiUserModel> userList = List<ApiUserModel>.from(
          userMapList.map((e) => ApiUserModel.fromjson(e)));
      return userList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //post Api
  Future createPostApi(Map<String, dynamic> body) async {
    final response = await postHttp(api: ApiUrls.posts, data: body);
    print(response.body);
    if (response.statusCode == 201) {
      print('post created sucessfully');
    } else {
      print('some error');
    }
  }
}
