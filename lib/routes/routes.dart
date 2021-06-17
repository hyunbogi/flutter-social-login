import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_login/exports.dart';

part 'handlers.dart';

part 'paths.dart';

class AppRoutes {
  const AppRoutes._();

  static final FluroRouter _router = FluroRouter();

  static RouteFactory get routeGenerator => _router.generator;

  static void init() {
    _mapPathsToHandlers();
  }

  static void _mapPathsToHandlers() {
    final mappings = <String, Handler>{
      _AppPath.root: _rootHandler,
    };

    mappings.entries.forEach((entry) {
      _router.define(entry.key, handler: entry.value);
    });
  }
}
