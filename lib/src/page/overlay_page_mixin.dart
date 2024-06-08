/// @author luwenjie on 2024/2/28 22:59:26
///
import 'package:flutter/widgets.dart';
import 'package:uizakura/uizakura.dart';

mixin OverLayerMixin<T extends StatefulWidget> on State<T> {
  bool get isFirstFrameEnd;

  final OverlayManager _overlayManager = OverlayManager();

  Future<OverlayEntry?> showOverlay(Widget child,
      {Color? backgroundColor, Function()? onTap, Duration? duration}) async {
    if (!context.mounted) return null;
    while (!isFirstFrameEnd) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    return _overlayManager.show(
      context,
      child: child,
      backgroundColor: backgroundColor,
      onTap: onTap,
      duration: duration,
    );
  }

  Future<void> dismissOverlay({OverlayEntry? entry}) async {
    _overlayManager.dismiss(entry: entry);
  }

  Future<void> showLoading({String? text, bool dismissOnTap = false}) async {
    while (!isFirstFrameEnd) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    if (!context.mounted) return;
    _overlayManager.showLoading(
      context,
      text: text,
      dismissOnTap: dismissOnTap,
    );
  }

  Future<void> dismissLoading() async {
    _overlayManager.dismissLoading();
  }

  @override
  void dispose() {
    super.dispose();
    _overlayManager.dismiss();
  }
}
