import 'package:flutter/cupertino.dart';
import 'package:uizakura/src/widget/overlay/anim.dart';
import 'package:uizakura/src/widget/overlay/widget.dart';
import 'package:uizakura/src/widget/widget_extension.dart';

class EchoSnackBar extends StatelessWidget {
  final Widget snackBar;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Duration? duration;
  final OverLayAnimation? animation;
  final ValueNotifier<bool>? visibleNotifier;
  final OverLayController? controller;

  const EchoSnackBar({
    super.key,
    required this.snackBar,
    required this.child,
    this.duration = const Duration(seconds: 4),
    this.animation,
    this.padding,
    this.visibleNotifier,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return OverLayView(
      overLayer: snackBar,
      duration: duration,
      animation: animation ??
          const OverLayAnimation(
            dismissDuration: Duration(milliseconds: 200),
            showDuration: Duration(milliseconds: 400),
          ),
      padding: padding ??
          EdgeInsets.only(
              left: 20, right: 20, bottom: context.navigationBarHeight + 8),
      alignment: Alignment.bottomCenter,
      controller: controller,
      child: child,
    );
  }
}
