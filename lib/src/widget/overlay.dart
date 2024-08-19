import 'dart:async';

import 'package:flutter/material.dart';

/// @author luwenjie on 2023/9/28 16:24:44
///

class OverlayManager {
  final List<OverlayEntryHandle> _list = [];
  final _disposeSet = <Function?>[];

  void clear() {
    for (var element in _disposeSet) {
      element?.call();
    }
    for (var element in _list) {
      element.entry.remove();
    }
    _list.clear();
  }

  void removeByHandle(OverlayEntryHandle? handle) {
    if (handle == null) return;
    handle.entry.remove();
    _list.remove(handle);
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

  void removeWhere(bool Function(OverlayEntryHandle e) where) {
    for (int i = 0; i < _list.length; i++) {
      final e = _list[i];
      if (where.call(e)) {
        e.entry.remove();
        _list.remove(e);
        return;
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
    Container? container,
  }) async {
    final overlayState = Overlay.maybeOf(context);
    if (overlayState == null) return null;

    late final OverlayEntryHandle handle;
    final overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: onTapOutside == null
              ? null
              : () {
                  onTapOutside.call(handle);
                },
          behavior: onTapOutside == null ? null : HitTestBehavior.opaque,
          child: Container(
            padding: container?.padding,
            alignment: container?.alignment ?? Alignment.topLeft,
            color: container?.color,
            decoration: container?.decoration,
            foregroundDecoration: container?.foregroundDecoration,
            constraints: container?.constraints,
            transform: container?.transform,
            transformAlignment: container?.transformAlignment,
            clipBehavior: container?.clipBehavior ?? Clip.none,
            child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: builder.call(
                  context,
                  handle,
                )),
          ),
        );
      },
    );
    handle = OverlayEntryHandle(
      entry: overlayEntry,
      tag: tag,
      priority: priority,
      manager: this,
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
        above = _list.first;
        insertIndex = 0;
      } else {
        for (int i = _list.length - 1; i >= 0; i--) {
          final e = _list[i];
          if (handle.priority >= e.priority) {
            below = e;
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
        removeByHandle(handle);
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

  OverlayEntryHandle({
    required this.entry,
    this.tag,
    this.priority = 0,
    required this.manager,
  });

  void dismiss() {
    manager.removeByHandle(this);
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
