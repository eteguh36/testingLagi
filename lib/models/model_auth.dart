part of 'model.dart';

class ResponseAuth {
  bool success;
  String message;
  Auth? auth;
  String token;
  String refresh;

  ResponseAuth({
    required this.success,
    required this.message,
    required this.auth,
    required this.token,
    required this.refresh,
  });

  factory ResponseAuth.fromJson(Map<String, dynamic> json) => ResponseAuth(
        success: json["success"],
        message: json["message"],
        auth: json["data"] == null ? null : Auth.fromJson(json["data"]),
        token: json["token"] ?? "",
        refresh: json["refresh"] ?? "",
      );
}

class Auth {
  String userId;
  String userName;
  String branch_id;
  int store_id;

  Auth({
    required this.userId,
    required this.userName,
    required this.branch_id,
    required this.store_id,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        branch_id: json["branch_id"] ?? "",
        store_id: json["store_id"] ?? 0,
        userId: json["user_id"],
        userName: json["user_name"],
      );
}
