import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// @author luwenjie on 2024/1/20 00:42:00

extension ScrolllerExtension on ScrollController {
  Future<void> scrollToBottom([Duration duration = const Duration(milliseconds: 400)]) async {
    await animateTo(position.maxScrollExtent,
        duration: duration, curve: Curves.fastOutSlowIn);
  }

  Future<void> scrollBy(double s,
      {Duration duration = const Duration(milliseconds: 200)}) async {
    await animateTo(offset + s,
        duration: duration, curve: Curves.fastOutSlowIn);
  }

  Future<void> scrollToTop({Duration duration = const Duration(milliseconds: 200)}) async {
    try {
      await animateTo(0, duration: duration, curve: Curves.fastOutSlowIn);
    } catch (e) {
      //
    }
  }

  Future<void> scrollTo(double s,
      {Duration duration = const Duration(milliseconds: 200)}) async {
    await animateTo(s, duration: duration, curve: Curves.fastOutSlowIn);
  }
}

extension RefreshIndicatorExtension on GlobalKey {
  Future<void> callRefresh() async {
    try {
      await (currentState as RefreshIndicatorState).show();
      // (currentState as RefreshIndicatorState).deactivate();
    } catch (e) {
      //
    }
  }
}
