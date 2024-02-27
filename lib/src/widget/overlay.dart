import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uizakura/uizakura.dart';
import 'package:uizakura/src/widget/click.dart';

/// @author luwenjie on 2023/9/28 16:24:44
///

class OverlayManager {
  final List<OverlayEntry> _list = [];
  OverlayEntry? _loadingEntry;
  final _disposeSet = <Function?>[];

  void dismiss({OverlayEntry? entry}) {
    if (entry == null) {
      for (var element in _disposeSet) {
        element?.call();
      }
      for (var element in _list) {
        element.remove();
      }
      _list.clear();
    } else {
      for (var element in _list) {
        if (element == entry) {
          element.remove();
        }
      }
      _list.remove(entry);
    }
  }

  showLoading(BuildContext context,
      {String? text, bool dismissOnTap = true, Widget? child}) {
    if (_loadingEntry != null) {
      dismissLoading();
    }
    _loadingEntry = show(context,
        backgroundColor: Colors.transparent,
        onTap: dismissOnTap ? dismissLoading : () {},
        child: Align(
            alignment: Alignment.center,
            child: child ??
                SizedBox.fromSize(
                  size: const Size.square(30),
                  child: const CircularProgressIndicator(),
                )));
  }

  dismissLoading() {
    _list.remove(_loadingEntry);
    _loadingEntry?.remove();
    _loadingEntry = null;
  }

  /// [backgroundColor] default dialogTheme.shadowColor
  OverlayEntry show(BuildContext context,
      {required Widget child,
      Color? backgroundColor,
      Function()? onTap,
      Duration? duration}) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
            width: context.screenWidth,
            height: context.screenHeight,
            alignment: Alignment.topLeft,
            color: backgroundColor ?? Theme.of(context).dialogTheme.shadowColor,
            child: child,
          ),
        );
      },
    );
    if (duration != null) {
      _disposeSet.add(Timer(duration, () {
        overlayEntry?.remove();
      }).cancel);
    }
    Overlay.of(context).insert(overlayEntry, below: _list.lastOrNull);
    _list.add(overlayEntry);
    return overlayEntry;
  }
}

extension OverlayContextExtension on BuildContext {
  OverlayState get overlayState => Overlay.of(this);

  show(OverlayEntry child) {
    overlayState.insert(child);
  }
}
