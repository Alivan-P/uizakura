import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'anim.dart';
import 'wrapper.dart';

/// @author luwenjie on 2023/9/28 16:24:44
///

class OverlayManager {
  static OverlayManager? _global;

  factory OverlayManager.global() {
    _global ??= OverlayManager();
    return _global!;
  }

  OverlayManager();

  final List<OverlayEntryHandle> _list = [];
  final _disposeSet = <Function?>[];

  void clear() {
    for (var element in _disposeSet) {
      element?.call();
    }
    for (var element in _list) {
      try {
        element.entry.remove();
      } catch (e) {
        //
      }
    }
    _list.clear();
  }

  void removeByTag(Object? tag) {
    if (tag == null) return;
    for (int i = _list.length - 1; i >= 0; i--) {
      final e = _list[i];
      if (e.tag == tag) {
        e.remove();
      }
    }
  }

  void removeWhere(bool Function(OverlayEntryHandle e) where) {
    for (int i = _list.length; i >= 0; i--) {
      final e = _list[i];
      if (where.call(e)) {
        e.remove();
      }
    }
  }

  Future<OverlayEntryHandle?> show(
    BuildContext context, {
    required Widget Function(
      BuildContext context,
      OverlayEntryHandle handle,
    ) builder,
    Object? tag,
    int priority = 0,
    Duration? duration,
    Function(OverlayEntryHandle handle)? onTapOutside,
    EdgeInsetsGeometry? padding,
    OverLayAnimation? animation,
    Alignment alignment = Alignment.topLeft,
    Color? color,
    Clip clipBehavior = Clip.none,
  }) async {
    final overlayState = Overlay.maybeOf(context);
    if (overlayState == null) return null;

    late final OverlayEntryHandle handle;
    final overLayerNotifier = ValueNotifier(true);
    final overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        final body = Container(
          padding: padding,
          alignment: alignment,
          color: color,
          clipBehavior: clipBehavior,
          child: GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: builder.call(
                context,
                handle,
              )),
        );
        return OverLayWrapper(
            animation: animation,
            visibleNotifier: overLayerNotifier,
            child: onTapOutside == null
                ? body
                : GestureDetector(
                    onTap: () {
                      onTapOutside.call(handle);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: body,
                  ));
      },
    );
    handle = OverlayEntryHandle(
      entry: overlayEntry,
      tag: tag,
      priority: priority,
      manager: this,
      visibleNotifier: overLayerNotifier,
    );

    int insertIndex = -1;
    OverlayEntryHandle? below;
    OverlayEntryHandle? above;
    if (_list.isEmpty) {
      insertIndex = -1;
    } else {
      if (handle.priority >= _list.last.priority) {
        insertIndex = -1;
      } else if (handle.priority < _list.first.priority) {
        below = _list.first;
        insertIndex = 0;
      } else {
        for (int i = _list.length - 1; i >= 0; i--) {
          final e = _list[i];
          if (handle.priority >= e.priority) {
            above = e;
            insertIndex = i;
            break;
          }
        }
      }
    }

    if (insertIndex >= 0) {
      _list.insert(insertIndex, handle);
    } else {
      _list.add(handle);
    }

    if (duration != null) {
      _disposeSet.add(Timer(duration, () {
        handle.dismiss();
      }).cancel);
    }
    overlayState.insert(
      overlayEntry,
      below: below?.entry,
      above: above?.entry,
    );
    return handle;
  }
}

class OverlayEntryHandle {
  final OverlayEntry entry;
  final Object? tag;
  final OverlayManager manager;
  final int priority;
  final ValueNotifier<bool> visibleNotifier;
  final OverLayAnimation? animation;

  OverlayEntryHandle({
    required this.entry,
    this.animation,
    this.tag,
    this.priority = 0,
    required this.manager,
    required this.visibleNotifier,
  });

  void remove() async {
    try {
      entry.remove();
    } catch (e) {
      //
    }
    manager._list.remove(this);
  }

  void dismiss() async {
    if (animation != null) {
      await Future.delayed(animation!.dismissDuration);
    }
    try {
      entry.remove();
    } catch (e) {
      //
    }
    manager._list.remove(this);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OverlayEntryHandle &&
          runtimeType == other.runtimeType &&
          entry == other.entry &&
          tag == other.tag &&
          priority == other.priority;

  @override
  int get hashCode => entry.hashCode ^ tag.hashCode ^ priority.hashCode;
}
