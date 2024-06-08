import 'dart:async';

import 'package:flutter/material.dart';

/// @author luwenjie on 2023/9/28 16:24:44
///

class OverlayManager {
  final List<OverlayEntry> _list = [];
  final _disposeSet = <Function?>[];

  dismiss() {
    for (var element in _disposeSet) {
      element?.call();
    }
    for (var element in _list) {
      element.remove();
    }
    _list.clear();
  }

  OverlayEntry show(BuildContext context,
      {required Widget child,
        Color? backgroundColor,
        Function()? onTap,
        Duration? duration}) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap ??
                  () {
                dismiss();
              },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topLeft,
            color: backgroundColor ?? const Color(0xFF000000).withOpacity(0.7),
            child: child,
          ),
        );
      },
    );
    _list.add(overlayEntry);
    if (duration != null) {
      _disposeSet.add(Timer(duration, () {
        overlayEntry.remove();
      }).cancel);
    }
    Overlay.of(context).insert(overlayEntry);
    return overlayEntry;
  }
}

extension OverlayContextExtension on BuildContext {
  OverlayState get overlayState => Overlay.of(this);

  show(OverlayEntry child) {
    overlayState.insert(child);
  }
}
