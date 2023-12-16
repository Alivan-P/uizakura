/// @author luwenjie on 2023/7/13 00:01:01

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static dismiss() {
    FToast().removeCustomToast();
  }

  static initialize(BuildContext mainContext) {
    FToast fToast = FToast();
    fToast.context = mainContext;
  }

  static showError(String text) {
    show(text, duration: const Duration(seconds: 6));
  }

  static show(String text, {Duration? duration}) {
    if (text.trim().isEmpty) return;
    if (FToast().context == null) return;
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

    FToast().showToast(
        child: toast,
        gravity: ToastGravity.CENTER,
        toastDuration: duration ?? const Duration(milliseconds: 2500),
        fadeDuration: const Duration(milliseconds: 240));
  }
}
