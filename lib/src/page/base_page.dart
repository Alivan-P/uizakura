import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @author luwenjie on 2023/4/28 11:22:13
///
///
/// @author luwenjie on 2023/4/28 11:17:22

abstract class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});
}

abstract class BasePageState<T extends BasePage> extends ConsumerState<T>
    with WidgetsBindingObserver {
  final _disposeSet = <Function?>[];
  final _disposeFutures = <Future<dynamic>>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // addDispose(congThemeUtil.listen((CongThemeMode mode) {
    //   setState(() {});
    // }));
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @protected
  void addDispose(Function block) async {
    _disposeSet.add(block);
  }

  @protected
  void addDisposeFuture(Future<dynamic> future) async {
    _disposeFutures.add(future);
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
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
