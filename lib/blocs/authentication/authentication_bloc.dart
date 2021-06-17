import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_social_login/exports.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationRequested) {
      final authService = Injector.getAuthService(event.authType);
      final authResult = await authService.authenticate();

      yield (authResult.success && authResult.userId != null)
          ? AuthenticationSuccess(
              authType: authResult.authType, userId: authResult.userId!)
          : AuthenticationFailed(authType: authResult.authType);
    }
  }

  void requestAuthentication(AuthType authType) {
    add(AuthenticationRequested(authType: authType));
  }
}
