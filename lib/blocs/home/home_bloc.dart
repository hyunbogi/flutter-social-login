import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_social_login/exports.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeAuthenticationRequested) {
      switch (event.authType) {
        case AuthType.kakao:
          yield* _loginKakao();
          return;

        case AuthType.facebook:
          yield* _loginFacebook();
          return;

        case AuthType.naver:
          yield* _loginNaver();
          return;

        default:
          throw UnsupportedError('Invalid auth type.');
      }
    }
  }

  void requestAuthentication(AuthType authType) {
    add(HomeAuthenticationRequested(authType: authType));
  }

  Stream<HomeState> _loginKakao() async* {
    try {
      final kakaoTalkInstalled = await isKakaoTalkInstalled();
      final authCode = kakaoTalkInstalled
          ? await AuthCodeClient.instance.requestWithTalk()
          : await AuthCodeClient.instance.request();

      final token = await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);

      final me = await UserApi.instance.me();

      yield HomeAuthenticated(
        success: true,
        authType: AuthType.kakao,
        userId: me.id.toString(),
      );
    } catch (e) {
      yield HomeAuthenticated(success: false, authType: AuthType.kakao);
    }
  }

  Stream<HomeState> _loginFacebook() async* {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status != LoginStatus.success) {
        yield HomeAuthenticated(success: false, authType: AuthType.kakao);
        return;
      }

      final userData = await FacebookAuth.instance.getUserData();
      final userId = userData['id']!.toString();

      yield HomeAuthenticated(
        success: true,
        authType: AuthType.kakao,
        userId: userId,
      );
    } catch (e) {
      yield HomeAuthenticated(success: false, authType: AuthType.facebook);
    }
  }

  Stream<HomeState> _loginNaver() async* {
    try {
      final result = await FlutterNaverLogin.logIn();
      if (result.status != NaverLoginStatus.loggedIn) {
        yield HomeAuthenticated(success: false, authType: AuthType.naver);
        return;
      }

      yield HomeAuthenticated(
        success: true,
        authType: AuthType.naver,
        userId: result.account.id,
      );
    } catch (e) {
      yield HomeAuthenticated(success: false, authType: AuthType.naver);
    }
  }
}
