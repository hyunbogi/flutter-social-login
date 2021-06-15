import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_social_login/exports.dart';

class NaverAuthService extends AuthService {
  @override
  Future<AuthResult> authenticate() async {
    const authType = AuthType.naver;

    try {
      final result = await FlutterNaverLogin.logIn();
      if (result.status != NaverLoginStatus.loggedIn) {
        return AuthResult(authType: authType, success: false);
      }

      return AuthResult(
        authType: authType,
        success: true,
        userId: result.account.id,
      );
    } catch (e) {
      return AuthResult(authType: authType, success: false);
    }
  }
}
