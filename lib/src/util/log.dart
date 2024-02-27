import 'package:flutter/foundation.dart';

/// @author luwenjie on 2024/2/27 15:43:53

class Logger {
  static void initialize() async {}

  static void clear() {
    // DataBase.logClear();
  }

  static Future<void> print(String tag, String s) async {
    debugPrint(
        "\n$tag:-------------------------\n$s\n-------------------------\n");
  }
}
