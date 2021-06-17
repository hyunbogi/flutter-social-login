import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_login/exports.dart';
import 'package:kakao_flutter_sdk/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup system configurations.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Initialize logger.
  Logger.init(kDebugMode);

  // Register application objects.
  Injector.registerObjects();

  // Initialize navigator.
  AppRoutes.init();

  // Register global bloc observer.
  Bloc.observer = Injector.blocObserver;

  // Initialize Kakao SDK.
  KakaoContext.clientId = 'your_kakao_native_app_key';

  runApp(Application());
}
