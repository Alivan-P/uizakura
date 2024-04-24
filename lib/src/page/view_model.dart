import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @author luwenjie on 2023/4/22 18:26:16

abstract class UizakuraViewModel<T> extends StateNotifier<T> {
  final _disposeSet = <Function?>[];
  bool _disposed = false;

  get disposed => _disposed;

  UizakuraViewModel(super.state) {
    _initialize();
  }

  @protected
  void _initialize() {}

  @override
  @protected
  set state(T value) {
    if (_disposed) return;
    super.state = (value);
  }

  @protected
  @Deprecated("use state = newState")
  void update(T Function(T state) cb) {
    if (_disposed) return;
    super.state = cb.call(state);
  }

  @protected
  void addDispose(Function() block) {
    _disposeSet.add(block);
  }

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
    try {
      for (var element in _disposeSet) {
        element?.call();
      }
    } catch (e) {
      //
    }
  }
}

AutoDisposeStateNotifierProviderFamily<VM, S, ViewModelKey<T>>
    buildViewModelFactory<VM extends UizakuraViewModel<S>, S,
        T extends Object>({
  required VM Function(ViewModelKey<T> key) viewModel,
}) {
  return StateNotifierProvider.autoDispose
      .family<VM, S, ViewModelKey<T>>((ref, key) {
    return viewModel.call(key);
  });
}

@immutable
class ViewModelKey<T extends Object> {
  final Object key;
  final T arg;

  factory ViewModelKey.fromArg(T arg) {
    return ViewModelKey(key: arg, arg: arg);
  }

  const ViewModelKey({required this.key, required this.arg});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewModelKey &&
          runtimeType == other.runtimeType &&
          key == other.key;

  @override
  int get hashCode => key.hashCode;

  @override
  String toString() {
    return 'ViewModelKey{key: $key}';
  }
}
