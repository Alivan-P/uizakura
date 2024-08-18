import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @author luwenjie on 2023/4/22 18:26:16
typedef ViewModelProvider<VM extends UizakuraViewModel<S>, S>
    = AutoDisposeStateNotifierProvider<VM, S>;

typedef ViewModelProviderBuilder<VM extends UizakuraViewModel<S>, S, ARG>
    = AutoDisposeStateNotifierProviderFamily<VM, S, ARG>;

abstract class UizakuraViewModel<T> extends StateNotifier<T> {
  final _disposeSet = <Function?>[];
  bool _disposed = false;

  get disposed => _disposed;

  UizakuraViewModel(super.state) {
    _initialize();
  }

  @protected
  void _initialize() {}

  @protected
  void update(T Function(T state) cb) {
    if (_disposed) return;
    super.state = cb.call(state);
  }

  /// expose for page
  T get requireState {
    return super.state;
  }

  T? get activeState {
    if (disposed) return null;
    return requireState;
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

ViewModelProviderBuilder<VM, S, ProviderKey<T>> buildViewModelProvider<
    VM extends UizakuraViewModel<S>, S, T extends Object>({
  required VM Function(ProviderKey<T> key) viewModel,
}) {
  return StateNotifierProvider.autoDispose
      .family<VM, S, ProviderKey<T>>((ref, key) {
    return viewModel.call(key);
  });
}

@immutable
class ProviderKey<T extends Object> {
  final String? key;
  final dynamic arg;

  T get requireArg {
    return arg as T;
  }

  final Object _defaultKey =
      "uizakura.ProviderKey(${DateTime.now().microsecondsSinceEpoch})";

  static const _uniqueKey = "uizakura.ProviderKey._uniqueKey";

  Object get _key {
    return key ?? _defaultKey;
  }

  factory ProviderKey.unique({T? arg}) {
    return ProviderKey(key: _uniqueKey, arg: arg);
  }

  ProviderKey({
    this.key,
    this.arg,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ProviderKey &&
            runtimeType == other.runtimeType &&
            _key == other._key;
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
