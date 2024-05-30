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

AutoDisposeStateNotifierProviderFamily<VM, S, ProviderKey<T>>
    buildLinjieProvider<VM extends UizakuraViewModel<S>, S, T extends Object>({
  required VM Function(ProviderKey<T> key) viewModel,
}) {
  return StateNotifierProvider.autoDispose
      .family<VM, S, ProviderKey<T>>((ref, key) {
    return viewModel.call(key);
  });
}

@immutable
class ProviderKey<T extends Object> {
  final Object? key;
  final T arg;

  final Object _defaultKey =
      "ProviderKey(${DateTime.now().millisecondsSinceEpoch})";

  Object get _key {
    return key ?? _defaultKey;
  }

  factory ProviderKey.fromArg(T arg) {
    return ProviderKey(key: arg, arg: arg);
  }

  ProviderKey({
    this.key,
    required this.arg,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ProviderKey &&
            runtimeType == other.runtimeType &&
            _key == other.key;
  }

  @override
  int get hashCode {
    return _key.hashCode;
  }

  @override
  String toString() {
    return 'ProviderKey{key: $_key}';
  }
}
