import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_login/exports.dart';

part 'handlers.dart';

part 'paths.dart';

class AppRoutes {
  const AppRoutes._();

  static late FluroRouter _router;

  static RouteFactory get routeGenerator => _router.generator;

  static void init(FluroRouter fluroRouter) {
    _router = fluroRouter;
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
