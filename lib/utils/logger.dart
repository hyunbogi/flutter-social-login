import 'package:logger/logger.dart' as log;

class Logger {
  static late final log.Logger? _logger;

  static void init([bool useLogger = true]) {
    _logger = useLogger ? log.Logger() : null;
  }

  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(log.Level.verbose, message, error, stackTrace);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(log.Level.debug, message, error, stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(log.Level.info, message, error, stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(log.Level.warning, message, error, stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(log.Level.error, message, error, stackTrace);
  }

  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log(log.Level.wtf, message, error, stackTrace);
  }

  static void _log(
    log.Level level,
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger?.log(level, message, error, stackTrace);
  }
}
