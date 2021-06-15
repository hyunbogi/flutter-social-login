import 'package:flutter_social_login/exports.dart';
import 'package:kakao_flutter_sdk/all.dart';

class KakaoAuthService extends AuthService {
  @override
  Future<AuthResult> authenticate() async {
    const authType = AuthType.kakao;

    try {
      final kakaoTalkInstalled = await isKakaoTalkInstalled();
      final authCode = kakaoTalkInstalled
          ? await AuthCodeClient.instance.requestWithTalk()
          : await AuthCodeClient.instance.request();

      final token = await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);

      final me = await UserApi.instance.me();

      return AuthResult(
        authType: authType,
        success: true,
        userId: me.id.toString(),
      );
    } catch (e) {
      return AuthResult(authType: authType, success: false);
    }
  }
}
