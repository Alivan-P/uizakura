import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @author luwenjie on 2023/4/22 18:26:16

abstract class ViewModel<T> extends StateNotifier<T> {
  final _disposeSet = <Function?>[];
  final _disposeFutures = <Future<dynamic>>[];
  var _disposed = false;

  get disposed => _disposed;

  ViewModel(super.state) {
    _initialize();
  }

  void _initialize() {}

  @override
  @Deprecated("use updateState")
  set state(T value) {
    super.state = (value);
  }

  @protected
  void update(T Function(T state) cb) {
    if (_disposed) return;
    super.state = cb.call(state);
  }

  @protected
  void addDispose(Function() block) {
    _disposeSet.add(block);
  }

  @protected
  void addDisposeFuture(Future<dynamic> future) async {
    _disposeFutures.add(future);
  }

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
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
  }
}
