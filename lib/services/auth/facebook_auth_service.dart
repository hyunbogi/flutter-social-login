import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_social_login/exports.dart';

class FacebookAuthService extends AuthService {
  @override
  Future<AuthResult> authenticate() async {
    const authType = AuthType.facebook;

    try {
      final result = await FacebookAuth.instance.login();
      if (result.status != LoginStatus.success) {
        return AuthResult(authType: authType, success: false);
      }

      final userData = await FacebookAuth.instance.getUserData();
      final userId = userData['id']!.toString();

      return AuthResult(authType: authType, success: true, userId: userId);
    } catch (e) {
      return AuthResult(authType: authType, success: false);
    }
  }
}
