import 'state.dart';

/// @author luwenjie on 2023/4/22 15:26:03
///

mixin LifecycleOwner {
  Lifecycle get lifecycle;

  bool get isResumed =>
      lifecycle.currentState.isAtLeast(LifecycleState.resumed);
}

abstract class Lifecycle {
  void addObserver(LifecycleObserver observer);

  void removeObserver(LifecycleObserver observer);

  void clearObserver();

  LifecycleState get currentState;
}

mixin LifecycleObserver {}
