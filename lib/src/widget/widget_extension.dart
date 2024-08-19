import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:uizakura/uizakura.dart';

/// @author luwenjie on 2023/10/10 11:50:23

extension GlobalKeyExtenstion on GlobalKey {
  RenderBox get renderBox => currentContext?.findRenderObject() as RenderBox;

  Offset get globalOffset => renderBox.localToGlobal(
        Offset.zero,
      );
}

extension GapExtension on num {
  Gap get gap {
    return Gap(toDouble());
  }
}

extension ContextExtenstion on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      Widget content,
      {SnackBarAction? action}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    return ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: content,
      showCloseIcon: true,
      action: action,
    ));
  }

  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => MediaQuery.of(this).size.width;

  // 会随着键盘弹起变化
  EdgeInsets get padding => MediaQuery.of(this).padding;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;

  double get navigationBarHeight => MediaQuery.of(this).viewPadding.bottom;

  void dismissDialog() {
    if (Navigator.canPop(this)) {
      Navigator.pop(this);
    }
  }

  void showLoadingDialog({String loadingMsg = "Loading..."}) {
    showDialog(
      context: this,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(loadingMsg)
              ],
            ),
          ),
        );
      },
    );
  }
}

extension SliverExtenstion on Widget {
  SliverToBoxAdapter get sliverBox {
    return SliverToBoxAdapter(
      child: this,
    );
  }
}

extension WidgetStateExtenstion on State<dynamic> {
  bool get isMounted {
    try {
      return context.mounted;
    } catch (e) {
      return false;
    }
  }

  Future<void> rebuild() async {
    if (!mounted) return;
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return;
    }
    // ignore: invalid_use_of_protected_member
    setState(() {});
  }

  Future<T> postFrameCallback<T>(T Function() thenCallback) {
    final Completer<T> completer = Completer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      completer.complete(thenCallback.call());
    });
    return completer.future;
  }
}

FutureOr<void> copyToClipboard(String? text) async {
  if (text.isNullOrEmpty) {
    return;
  }
  return Clipboard.setData(ClipboardData(text: text!));
}
