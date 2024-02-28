import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uizakura/src/widget/after_layout.dart';

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
        AfterLayoutMixin<T>,
        OverLayerMixin<T>,
        AutoDisposeMixin<T> {
  bool _isAfterFirstLayout = false;

  @override
  bool get isAfterFirstLayout => _isAfterFirstLayout;

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

  @mustCallSuper
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _isAfterFirstLayout = true;
    return super.afterFirstLayout(context);
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
