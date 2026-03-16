import 'dart:convert';

class LoginResponse {
  final String token;
  final String? userFullName;

  LoginResponse({required this.token, this.userFullName});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'token': token, 'userFullName': userFullName};
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      token: map['token'] as String,
      userFullName: map['userFullName'] != null
          ? map['userFullName'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
