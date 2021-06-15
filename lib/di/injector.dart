import 'package:fluro/fluro.dart';
import 'package:flutter_social_login/exports.dart';
import 'package:get_it/get_it.dart';

class Injector {
  const Injector._();

  static GetIt get _instance => GetIt.instance;

  static FluroRouter get router => _instance.get<FluroRouter>();

  static AuthService getAuthType(AuthType authType) {
    switch (authType) {
      case AuthType.kakao:
        return _instance.get<AuthService>(instanceName: 'kakao');
      case AuthType.facebook:
        return _instance.get<AuthService>(instanceName: 'facebook');
      case AuthType.naver:
        return _instance.get<AuthService>(instanceName: 'naver');
      default:
        throw UnsupportedError('Invalid auth type.');
    }
  }

  static void registerObjects() {
    // Register third-party objects.
    {
      _instance.registerSingleton<FluroRouter>(FluroRouter());
    }

    // Register authentication service objects.
    {
      _instance.registerFactory<AuthService>(
        () => KakaoAuthService(),
        instanceName: 'kakao',
      );
      _instance.registerFactory<AuthService>(
        () => FacebookAuthService(),
        instanceName: 'facebook',
      );
      _instance.registerFactory<AuthService>(
        () => NaverAuthService(),
        instanceName: 'naver',
      );
    }
  }
}
