part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationRequested extends AuthenticationEvent {
  final AuthType authType;

  AuthenticationRequested({required this.authType});
}
