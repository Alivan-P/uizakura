import 'package:flutter/cupertino.dart';
import 'package:uizakura/src/widget/widget_extension.dart';

/// @author luwenjie on 2024/2/27 15:13:03
///

/// 屏幕适配工具类
/// 支持宽高适配，字体适配，屏幕类型判断
class ScreenSizeUtil {
  static double _designWidth = 375;
  static double _designHeight = 812;
  static bool _allowFontScaling = false;

  static MediaQueryData? _mediaQueryData;
  static bool _initialized = false;

  ScreenSizeUtil._();

  /// 初始化设计稿尺寸和字体缩放开关
  /// [context] 用于获取实际屏幕尺寸和字体缩放因子
  static void initialize(
    BuildContext context, {
    required double designWidth,
    required double designHeight,
    bool allowFontScaling = false,
  }) {
    _designWidth = designWidth;
    _designHeight = designHeight;
    _allowFontScaling = allowFontScaling;

    _mediaQueryData = MediaQuery.of(context);
    _initialized = true;
  }

  /// 内部方法，自动初始化（如果尚未初始化），避免使用时忘记初始化导致异常
  static void _ensureInitialized(BuildContext context) {
    if (!_initialized) {
      initialize(context,
          designWidth: _designWidth,
          designHeight: _designHeight,
          allowFontScaling: _allowFontScaling);
    } else {
      // 每次适配时更新 MediaQueryData，防止屏幕旋转或字体缩放变化
      _mediaQueryData = MediaQuery.of(context);
    }
  }

  /// 获取屏幕宽度（自动考虑横竖屏）
  static double get screenWidth => _mediaQueryData!.size.width;

  /// 获取屏幕高度（自动考虑横竖屏）
  static double get screenHeight => _mediaQueryData!.size.height;

  /// 获取字体缩放因子
  static double get textScaleFactor => _mediaQueryData!.textScaleFactor;

  /// 适配宽度，按设计稿宽度比例缩放，限制缩放比例避免极端屏幕尺寸异常
  static double adaptiveWidth(BuildContext context, num size) {
    _ensureInitialized(context);
    final scale = (screenWidth / _designWidth).clamp(0.85, 1.25);
    return size * scale;
  }

  /// 适配高度，按设计稿高度比例缩放，限制缩放比例避免极端屏幕尺寸异常
  /// 不建议用作整体UI高度适配，适合特殊布局
  static double adaptiveHeight(BuildContext context, num size) {
    _ensureInitialized(context);
    final scale = (screenHeight / _designHeight).clamp(0.85, 1.25);
    return size * scale;
  }

  /// 适配字体大小，支持可选是否跟随系统字体缩放
  static double adaptiveFont(BuildContext context, num fontSize) {
    _ensureInitialized(context);
    final baseSize = adaptiveWidth(context, fontSize);
    if (_allowFontScaling) {
      return baseSize * textScaleFactor;
    }
    return baseSize;
  }

  /// 屏幕类型判断，根据屏幕宽度划分大小屏幕，方便做响应式布局
  static ScreenSizeType screenType(BuildContext context) {
    _ensureInitialized(context);
    final width = screenWidth;
    if (width < 600) return ScreenSizeType.small;
    if (width < 1024) return ScreenSizeType.medium;
    return ScreenSizeType.large;
  }
}

enum ScreenSizeType { small, medium, large }

extension BuildContextExt on BuildContext {
  double adaptiveWidth(num size) => ScreenSizeUtil.adaptiveWidth(this, size);

  double adaptiveHeight(num size) => ScreenSizeUtil.adaptiveHeight(this, size);

  double adaptiveFont(num size) => ScreenSizeUtil.adaptiveFont(this, size);

  ScreenSizeType get screenSizeType => ScreenSizeUtil.screenType(this);
}
