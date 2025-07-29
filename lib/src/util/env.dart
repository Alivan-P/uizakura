import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// @author luwenjie on 2023/9/14 22:47:54
/// @description App环境信息管理类，支持平台判断、版本信息、环境变量加载（基于 .env）.

class UizakuraAppEnv {
  static String _version = "";
  static String _buildCode = "";
  static int utcDeltaSeconds = 0;

  static final config = _EnvConfig();

  static String get version => _version;

  static String get buildCode => _buildCode;

  /// 初始化：加载版本信息 + 加载 .env 环境变量
  static Future<void> initialize({String? envFile}) async {
    // 获取版本信息
    await PackageInfo.fromPlatform().then((value) {
      _version = value.version;
      _buildCode = value.buildNumber;
    });

    // initialize 指定的优先级最高，dart-define 的优先级最低
    const defineEnv = String.fromEnvironment('ENV', defaultValue: '.env.dev');
    final file = envFile ?? defineEnv;

    await dotenv.load(fileName: file);
  }

  static String get envName => config.get('APP_ENV', defaultValue: 'dev');

  static bool get isDebug => envName == 'dev';

  static bool get isRelease => envName == 'prod';

  static bool get isTest => envName == 'test';

  static get isAndroid => kIsWeb ? false : Platform.isAndroid;

  static get isIOS => kIsWeb ? false : Platform.isIOS;

  static get isWindows => kIsWeb ? false : Platform.isWindows;

  static get isMacOS => kIsWeb ? false : Platform.isMacOS;

  static get isMobile => kIsWeb ? false : Platform.isAndroid || Platform.isIOS;

  static get isDesktop => kIsWeb
      ? false
      : Platform.isLinux || Platform.isWindows || Platform.isMacOS;
}

/// 内部环境配置类，统一读取 .env 参数
class _EnvConfig {
  /// 获取字符串配置
  String get(String key, {String defaultValue = ''}) {
    final value = dotenv.env[key];
    return value ?? defaultValue;
  }

  /// 获取布尔值配置
  bool getBool(String key, {bool defaultValue = false}) {
    final value = dotenv.env[key]?.toLowerCase();
    if (value == null) return defaultValue;
    return value == 'true' || value == '1';
  }

  /// 获取整数配置
  int getInt(String key, {int defaultValue = 0}) {
    final value = int.tryParse(dotenv.env[key] ?? '');
    return value ?? defaultValue;
  }

  /// 获取浮点数配置
  double getDouble(String key, {double defaultValue = 0.0}) {
    final value = double.tryParse(dotenv.env[key] ?? '');
    return value ?? defaultValue;
  }
}
