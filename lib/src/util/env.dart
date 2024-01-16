import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// @author luwenjie on 2023/9/14 22:47:54

class LuAppEnv {
  static String _version = "";
  static String _buildCode = "";
  static int utcDeltaSeconds = 0;

  static String get version => _version;

  static String get buildCode => _buildCode;

  static Future<void> init() async {
    await PackageInfo.fromPlatform().then((value) {
      _version = value.version;
      _buildCode = value.buildNumber;
    });
  }

  static get isDebug => kDebugMode;

  static get isRelease => kReleaseMode;

  static get isAndroid => kIsWeb ? false : Platform.isAndroid;

  static get isWindows => kIsWeb ? false : Platform.isWindows;

  static get isMobile => kIsWeb ? false : Platform.isAndroid || Platform.isIOS;

  static get isDesktop => kIsWeb
      ? false
      : Platform.isLinux || Platform.isWindows || Platform.isMacOS;
}
