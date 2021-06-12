import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_login/exports.dart';
import 'package:kakao_flutter_sdk/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Kakao SDK.
  KakaoContext.clientId = 'your_kakao_native_app_key';

  // Setup system configurations.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Register application objects.
  Injector.registerObjects();

  // Initialize navigator.
  AppRoutes.init(Injector.router);

  runApp(Application());
}
