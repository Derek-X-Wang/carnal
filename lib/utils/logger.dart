import 'package:logger/logger.dart';

// https://medium.com/flutter-community/a-guide-to-setting-up-better-logging-in-flutter-3db8bab2000e

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: false,
  )
);