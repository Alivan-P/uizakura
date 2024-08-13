import 'package:flutter/material.dart';
import 'package:uizakura/uizakura.dart';

mixin OverLayerMixin<T extends StatefulWidget> on State<T> {
  bool get isShowing;
  bool get isDisposed;

  final _loadingTag = Object();
  final OverlayManager _overlayManager = OverlayManager();

  Future<OverlayEntry?> showOverlay(
    Widget child, {
    Duration? duration,
  }) async {
    if (isDisposed) return null;
    while (isShowing) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (isDisposed) return null;
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
    while (!isShowing) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (isDisposed) return;
    }
    if (isDisposed) return;
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
