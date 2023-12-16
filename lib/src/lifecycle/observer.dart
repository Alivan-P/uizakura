import 'lifecycle.dart';
import 'state.dart';

/// @author luwenjie on 2023/4/22 15:54:00
///

abstract class LifecycleEventObserver with LifecycleObserver {
  /// Called when a state transition event happens.
  ///
  /// @param source The source of the event
  /// @param event The event
  void onStateChanged(LifecycleOwner source, LifecycleEvent event);
}

class FullLifecycleObserver with LifecycleObserver {
  final Function(LifecycleOwner owner)? onCreate;
  final Function(LifecycleOwner owner)? onVisible;
  final Function(LifecycleOwner owner)? onInvisible;
  final Function(LifecycleOwner owner)? onDispose;
  final Function(LifecycleOwner owner)? onBackground;
  final Function(LifecycleOwner owner)? onForeground;

  FullLifecycleObserver({
    this.onCreate,
    this.onVisible,
    this.onInvisible,
    this.onDispose,
    this.onBackground,
    this.onForeground,
  });
}
