import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uizakura/src/page/view_model.dart';
import 'package:uizakura/src/widget/on_first_frame_mixin.dart';
import 'package:uizakura/src/widget/widget_extension.dart';
import 'package:widget_lifecycle/widget_lifecycle.dart';

import 'auto_dispose_mixin.dart';
import 'overlay_page_mixin.dart';

/// @author luwenjie on 2023/4/28 11:22:13
///
///
/// @author luwenjie on 2023/4/28 11:17:22

abstract class UizakuraPage extends ConsumerStatefulWidget {
  const UizakuraPage({super.key});
}

abstract class UizakuraPageState<T extends UizakuraPage>
    extends ConsumerState<T>
    with
        WidgetsBindingObserver,
        OnFirstFrameEndMixin<T>,
        OverLayerMixin<T>,
        AutoDisposeMixin<T> {
  late final LifecycleController _lifecycleController = LifecycleController();

  bool _showing = false;
  bool _disposed = false;

  @override
  bool get isDisposed => _disposed || !isMounted;

  @override
  bool get isShowing => _showing;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<VM> refreshProvider<VM extends UizakuraViewModel<dynamic>>(
    ViewModelProvider<VM, dynamic> provider,
  ) async {
    ref.invalidate(provider);
    return await setStateAsync<VM>(() => getViewModel(provider));
  }

  VM getViewModel<VM extends UizakuraViewModel<dynamic>>(
      ViewModelProvider<VM, dynamic> provider) {
    return ref.read(provider.notifier);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    setState();
  }

  @override
  void setState([VoidCallback? fn]) {
    if (isDisposed) return;
    super.setState(fn ?? () {});
  }

  FutureOr<void> onFirstShowing(BuildContext context) {}

  @mustCallSuper
  @override
  @visibleForTesting
  FutureOr<void> onFirstFrameEnd(BuildContext context) async {
    _showing = true;
    if (!isDisposed) await super.onFirstFrameEnd(context);
    if (!isDisposed) await onFirstShowing(context);
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  void onPreBuild(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    onPreBuild(context);
    return LifecycleAware(
      callShowOnAppResume: true,
      callHideOnAppPause: true,
      controller: _lifecycleController,
      onShow: () {
        _showing = true;
      },
      onHide: () {
        _showing = false;
      },
      child: buildPage(context),
    );
  }

  Widget buildPage(BuildContext context);

  @override
  @mustCallSuper
  void dispose() {
    _showing = false;
    _disposed = true;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
