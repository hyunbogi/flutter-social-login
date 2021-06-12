part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeAuthenticationRequested extends HomeEvent {
  final AuthType authType;

  HomeAuthenticationRequested({required this.authType});
}
