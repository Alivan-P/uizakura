import 'package:flutter/material.dart';
import 'package:uizakura/src/widget/overlay.dart';

mixin OverLayerWidgetStateMixin<T extends StatefulWidget> on State<T> {
  final OverlayManager _overlayManager = OverlayManager();

  @protected
  OverlayManager get overlayManager => _overlayManager;

  @override
  void dispose() {
    _overlayManager.clear();
    super.dispose();
  }
}
