import 'package:logger/logger.dart';

class TLoggerHelper {
  static final Logger _logeer = Logger(
    printer: PrettyPrinter(),
    //costmize the log levels based on your needs
    level: Level.debug,
  );
  static void debug(Set message) {
    _logeer.d(message);
  }

  static void info(String message) {
    _logeer.i(message);
  }

  static void warning(String message) {
    _logeer.w(message);
  }

  static void error(String message, [dynamic eroor]) {
    _logeer.e(message, error: eroor, stackTrace: StackTrace.current);
  }
}
