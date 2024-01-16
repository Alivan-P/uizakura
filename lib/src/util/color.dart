import 'dart:ui';

import 'package:flutter/material.dart';

/// @author luwenjie on 2023/10/3 16:48:39
///
class LuColorUtil {
  static Color inverseColor(Color color) {
    return Color.fromARGB(
      color.alpha,
      255 - color.red,
      255 - color.green,
      255 - color.blue,
    );
  }

  static Color parseColor(String value) {
    try {
      int colorValue = 0;
      if (value.startsWith('#')) {
        colorValue = int.tryParse(value.replaceRange(0, 1, ''), radix: 16) ?? 0;
      }

      if (value.length == '#FFFFFF'.length && value.startsWith('#')) {
        colorValue |= 0xFF000000;
      }
      return Color(colorValue);
    } catch (e) {
      return Colors.transparent;
    }
  }
}

extension ColorExtension on Color {
  Color get inverse => LuColorUtil.inverseColor(this);
}
