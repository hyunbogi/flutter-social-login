import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_login/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup system configurations.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Register application objects.
  Injector.registerObjects();

  // Initialize navigator.
  AppRoutes.init(Injector.router);

  runApp(Application());
}
