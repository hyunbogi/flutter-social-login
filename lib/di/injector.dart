import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';

class Injector {
  const Injector._();

  static GetIt get _instance => GetIt.instance;

  static FluroRouter get router => _instance.get<FluroRouter>();

  static void registerObjects() {
    _instance.registerSingleton<FluroRouter>(FluroRouter());
  }
}
