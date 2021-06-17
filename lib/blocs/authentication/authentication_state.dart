part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final AuthType authType;
  final String userId;

  AuthenticationSuccess({required this.authType, required this.userId});
}

class AuthenticationFailed extends AuthenticationState {
  final AuthType authType;
  final String? errorMessage;

  AuthenticationFailed({required this.authType, this.errorMessage});
}
