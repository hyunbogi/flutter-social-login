part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeAuthenticated extends HomeState {
  final bool success;
  final AuthType authType;
  final String? userId;

  HomeAuthenticated({
    required this.success,
    required this.authType,
    this.userId,
  });
}
