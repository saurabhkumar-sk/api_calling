import 'package:api/api_services/base_service.dart';
import 'package:api/api_urls/api_urls.dart';

class UserService extends BaseService {
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
