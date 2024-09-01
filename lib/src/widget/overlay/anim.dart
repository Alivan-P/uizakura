// @author luwenjie on 2024/8/28 21:45:11

import 'package:flutter/widgets.dart';

class OverLayAnimation {
  final Duration dismissDuration;

  final Curve dismissCurve;

  final Duration showDuration;

  final Curve showCurve;

  const OverLayAnimation({
    this.dismissDuration = const Duration(milliseconds: 300),
    this.dismissCurve = Curves.easeOut,
    this.showDuration = const Duration(milliseconds: 300),
    this.showCurve = Curves.easeIn,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OverLayAnimation &&
          runtimeType == other.runtimeType &&
          dismissDuration == other.dismissDuration &&
          dismissCurve == other.dismissCurve &&
          showDuration == other.showDuration &&
          showCurve == other.showCurve;

  @override
  int get hashCode =>
      dismissDuration.hashCode ^
      dismissCurve.hashCode ^
      showDuration.hashCode ^
      showCurve.hashCode;
}
