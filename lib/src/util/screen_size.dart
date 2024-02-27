import 'package:flutter/cupertino.dart';
import 'package:uizakura/src/widget/widget_extension.dart';

/// @author luwenjie on 2024/2/27 15:13:03
///

class ScreenSizeUtil {
  static double _width = 375;
  static double _height = 812;

  ScreenSizeUtil._();

  static void initialize({required double width, required double height}) {
    _width = width;
    _height = height;
  }

  static double adaptiveWidth(BuildContext context, num size) {
    return (size * 1.0 / _width) * context.screenWidth;
  }

  static double adaptiveHeight(BuildContext context, num size) {
    return (size * 1.0 / _height) * context.screenHeight;
  }
}

extension BuildContextExt on BuildContext {
  double adaptiveWidth(num size) {
    return ScreenSizeUtil.adaptiveWidth(this, size);
  }

  double adaptiveHeight(num size) {
    return ScreenSizeUtil.adaptiveHeight(this, size);
  }
}
