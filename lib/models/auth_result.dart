import 'package:flutter_social_login/exports.dart';

class AuthResult {
  AuthType authType;
  bool success;
  String? userId;
  String? error;

  AuthResult({
    required this.authType,
    required this.success,
    this.userId,
    this.error,
  });
}
