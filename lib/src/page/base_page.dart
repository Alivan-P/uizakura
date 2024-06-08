import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uizakura/src/widget/after_layout.dart';
import 'package:uizakura/src/widget/on_first_frame_mixin.dart';
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
  bool _isFirstFrameEnd = false;

  @override
  bool get isFirstFrameEnd => _isFirstFrameEnd;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (mounted) {
      setState(() {});
    }
  }

  FutureOr<void> onFirstFrameLayout(BuildContext context) {}

  @mustCallSuper
  @override
  @visibleForTesting
  FutureOr<void> onFirstFrameEnd(BuildContext context) async {
    _isFirstFrameEnd = true;
    if (context.mounted) await super.onFirstFrameEnd(context);
    if (context.mounted) await onFirstFrameLayout(context);
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  @mustCallSuper
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
