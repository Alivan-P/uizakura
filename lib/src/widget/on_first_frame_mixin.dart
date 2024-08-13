import 'dart:async';

import 'package:flutter/widgets.dart';

/// @author luwenjie on 2024/6/8 23:24:47

mixin OnFirstFrameEndMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) onFirstFrameEnd(context);
      },
    );
  }

  @protected
  FutureOr<void> onFirstFrameEnd(BuildContext context) {}
}
