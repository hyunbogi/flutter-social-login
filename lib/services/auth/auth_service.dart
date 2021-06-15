import 'package:flutter_social_login/exports.dart';

abstract class AuthService {
  Future<AuthResult> authenticate();
}
