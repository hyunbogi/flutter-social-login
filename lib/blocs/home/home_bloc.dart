import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_social_login/exports.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeAuthenticationRequested) {
      final authService = Injector.getAuthType(event.authType);
      final authResult = await authService.authenticate();

      yield (authResult.success && authResult.userId != null)
          ? HomeAuthenticated(
              success: true,
              authType: AuthType.kakao,
              userId: authResult.userId,
            )
          : HomeAuthenticated(
              success: false,
              authType: event.authType,
            );
    }
  }

  void requestAuthentication(AuthType authType) {
    add(HomeAuthenticationRequested(authType: authType));
  }
}
