import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_login/exports.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger.i('onEvent(bloc: $bloc, event: $event)');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Logger.i('onTransition(bloc: $bloc, transition: $transition)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger.i('onError(bloc: $bloc, error: $error, stackTrace: $stackTrace)');
  }
}
