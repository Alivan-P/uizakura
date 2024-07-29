import 'dart:async';

import 'package:flutter/material.dart';

/// @author luwenjie on 2023/9/28 16:24:44
///

class OverlayManager {
  final List<OverlayEntryWrapper> _list = [];
  final _disposeSet = <Function?>[];

  void dismiss() {
    for (var element in _disposeSet) {
      element?.call();
    }
    for (var element in _list) {
      element.entry.remove();
    }
    _list.clear();
  }

  void removeByEntry(OverlayEntry? entry) {
    if (entry == null) return;
    for (int i = 0; i < _list.length; i++) {
      final e = _list[i];
      if (e.entry == entry) {
        e.entry.remove();
        _list.remove(e);
        return;
      }
    }
  }

  void removeByTag(Object? tag) {
    if (tag == null) return;
    for (int i = 0; i < _list.length; i++) {
      final e = _list[i];
      if (e.tag == tag) {
        e.entry.remove();
        _list.remove(e);
        return;
      }
    }
  }

  OverlayEntry show(
    BuildContext context, {
    required Widget child,
    Object? tag,
    Duration? duration,
  }) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return child;
      },
    );
    final e = OverlayEntryWrapper(
      entry: overlayEntry,
      tag: tag,
    );
    _list.add(e);
    if (duration != null) {
      _disposeSet.add(Timer(duration, () {
        removeByTag(e.tag);
      }).cancel);
    }
    Overlay.of(context).insert(overlayEntry);
    return overlayEntry;
  }
}

class OverlayEntryWrapper {
  final OverlayEntry entry;
  final Object? tag;

  OverlayEntryWrapper({
    required this.entry,
    this.tag,
  });
}

extension OverlayContextExtension on BuildContext {
  OverlayState get overlayState => Overlay.of(this);

  show(OverlayEntry child) {
    overlayState.insert(child);
  }
}
