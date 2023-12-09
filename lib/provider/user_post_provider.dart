import 'package:api/api_services/user_services.dart';
import 'package:api/models/api_user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final service = UserService();
  String? title;
  set setTitle(String? val) => title == val;

  Future<void> createPost({
    required String title,
    required String body,
    // required String userId,
  }) async {
    try {
      Map<String, dynamic> data = {
        "title": title,
        "body": body,
        // "userId": userId,
      };
      await service.createPostApi(data);
    } catch (e) {
      print(e.toString());
    }
  }

  // get Api

  List<ApiUserModel> apiUSerList = [];
  Future<void> getApiUser() async {
    final response = await service.getUserApi();
    if (response != null) {
      apiUSerList = response;
    }
    notifyListeners();
  }
}
