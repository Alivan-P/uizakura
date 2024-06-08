import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// @author luwenjie on 2023/9/14 22:47:54

class UizakuraAppEnv {
  static String _version = "";
  static String _buildCode = "";
  static int utcDeltaSeconds = 0;

  static String get version => _version;

  static String get buildCode => _buildCode;

  static Future<void> initialize() async {
    await PackageInfo.fromPlatform().then((value) {
      _version = value.version;
      _buildCode = value.buildNumber;
    });
  }

  static get isDebug => kDebugMode;

  static get isRelease => kReleaseMode;

  static get isAndroid => kIsWeb ? false : Platform.isAndroid;

  static get isIos => kIsWeb ? false : Platform.isIOS;

  static get isWindows => kIsWeb ? false : Platform.isWindows;

  static get isLinux => kIsWeb ? false : Platform.isLinux;

  static get isMacOS => kIsWeb ? false : Platform.isMacOS;

  static get isMobile => kIsWeb ? false : Platform.isAndroid || Platform.isIOS;

  static get isDesktop => kIsWeb
      ? false
      : Platform.isLinux || Platform.isWindows || Platform.isMacOS;
}
