class ApiUserModel {
  final String name;
  final String email;
  final String username;

  ApiUserModel({
    required this.name,
    required this.email,
    required this.username,
  });
  factory ApiUserModel.fromjson(Map<String, dynamic> json) {
    return ApiUserModel(
      name: json['name'],
      email: json['email'],
      username: json['username'],
    );
  }
}
