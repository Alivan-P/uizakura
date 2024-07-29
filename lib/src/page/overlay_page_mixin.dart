/// @author luwenjie on 2024/2/28 22:59:26
///
import 'package:flutter/material.dart';
import 'package:uizakura/uizakura.dart';

mixin OverLayerMixin<T extends StatefulWidget> on State<T> {
  bool get isFirstFrameEnd;

  final _loadingTag = Object();
  final OverlayManager _overlayManager = OverlayManager();

  Future<OverlayEntry?> showOverlay(
    Widget child, {
    Duration? duration,
  }) async {
    if (!context.mounted) return null;
    while (!isFirstFrameEnd) {
      await Future.delayed(const Duration(milliseconds: 50));
    }
    return _overlayManager.show(
      context,
      child: child,
      duration: duration,
    );
  }

  Future<void> dismissOverlay() async {
    _overlayManager.dismiss();
  }

  Future<void> showLoading({String? text, bool dismissOnTap = false}) async {
    while (!isFirstFrameEnd) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    if (!context.mounted) return;
    _overlayManager.show(
      context,
      tag: _loadingTag,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          alignment: Alignment.center,
          child: const SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> dismissLoading() async {
    _overlayManager.removeByTag(_loadingTag);
  }

  @override
  void dispose() {
    super.dispose();
    _overlayManager.dismiss();
  }
}
