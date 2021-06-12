import 'dart:async';

import 'package:bloc/bloc.dart';
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
}
