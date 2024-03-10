import 'package:flutter/cupertino.dart';

/// @author luwenjie on 2024/2/28 23:04:09

mixin AutoDisposeMixin<T extends StatefulWidget> on State<T> {
  final _disposeSet = <Function?>[];

  @protected
  void addDispose(Function block) async {
    _disposeSet.add(block);
  }

  @override
  @mustCallSuper
  void dispose() {
    for (var element in _disposeSet) {
      try {
        element?.call();
      } catch (e) {
        debugPrint("AutoDisposeMixin error on $e");
      }
    }
    super.dispose();
  }
}
