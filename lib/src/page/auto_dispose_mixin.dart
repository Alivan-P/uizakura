import 'package:flutter/cupertino.dart';
import 'package:uizakura/uizakura.dart';

/// @author luwenjie on 2024/2/28 23:04:09

mixin AutoDisposeMixin<T extends StatefulWidget> on State<T> {
  final _disposeSet = <Function?>[];
  final _disposeFutures = <Future<dynamic>>[];

  @protected
  void addDispose(Function block) async {
    _disposeSet.add(block);
  }

  @protected
  void addDisposeFuture(Future<dynamic> future) async {
    _disposeFutures.add(future);
  }

  @override
  @mustCallSuper
  void dispose() {
    for (var element in _disposeSet) {
      element?.call();
    }
    // ignore disposed futures result
    try {
      for (Future<dynamic> element in _disposeFutures) {
        element.ignore();
      }
    } catch (e) {
      //
    }
    super.dispose();
  }
}
