import 'package:flutter/material.dart';

import 'overlay.dart';

mixin OverLayStateMixin<T extends StatefulWidget> on State<T> {
  final OverlayManager _overlayManager = OverlayManager();

  @protected
  OverlayManager get overlayManager => _overlayManager;

  @override
  void dispose() {
    _overlayManager.clear();
    super.dispose();
  }
}
