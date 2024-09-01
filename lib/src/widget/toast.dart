import 'package:flutter/material.dart';
import 'package:uizakura/src/widget/overlay/anim.dart';
import 'package:uizakura/src/widget/overlay/overlay.dart';

class Toast {
  static late BuildContext _context;
  static final Object _tag = Object();

  static dismiss() {
    OverlayManager.global().removeByTag(_tag);
  }

  static initialize(BuildContext context) {
    _context = context;
  }

  static show(String text, {Duration? duration}) {
    if (text.trim().isEmpty) return;
    dismiss();
    Widget toast = Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.black.withOpacity(0.7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );

    OverlayManager.global().show(
      _context,
      builder: (
        BuildContext context,
        OverlayEntryHandle handle,
      ) {
        return toast;
      },
      priority: 999,
      tag: _tag,
      alignment: Alignment.center,
      duration: duration ?? const Duration(milliseconds: 2500),
      animation: const OverLayAnimation(
        showDuration: Duration(milliseconds: 240),
        dismissDuration: Duration(milliseconds: 240),
      ),
    );
  }
}
