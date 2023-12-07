import 'package:api/api_services/user_services.dart';
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
}
