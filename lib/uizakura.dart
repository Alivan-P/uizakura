import 'package:flutter/cupertino.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

import 'uizakura.dart';

export "src/async_state/async_state.dart";
export "src/lifecycle/lifecycle.dart";
export "src/lifecycle/observer.dart";
export "src/lifecycle/state.dart";
export "src/lifecycle/widget.dart";
export "src/page/base_page.dart";
export 'src/page/paging.dart';
export "src/page/view_model.dart";
export "src/page/auto_dispose_mixin.dart";
export "src/page/overlay_page_mixin.dart";
export "src/util/color.dart";
export "src/util/date.dart";
export "src/util/env.dart";
export "src/util/file.dart";
export "src/util/file_picker.dart";
export "src/util/string_extension.dart";
export "src/util/list_extension.dart";
export "src/util/log.dart";
export "src/util/screen_size.dart";
export "src/util/event_bus.dart";
export "src/widget/after_layout.dart";
export "src/widget/click.dart";
export "src/widget/image.dart";
export "src/widget/load_more.dart";
export "src/widget/notifier.dart";
export "src/widget/overlay.dart";
export "src/widget/scroll_extension.dart";

/// @author luwenjie on 2023/9/15 00:11:57

export 'src/widget/toast.dart';
export 'src/widget/widget_extension.dart';

Future<void> initialize() async {
  await UizakuraAppEnv.initialize();
  await _setHighRate();
}

// 适配 coloros 等系统高刷，默认帧率很低
Future<void> _setHighRate() async {
  try {
    await FlutterDisplayMode.setHighRefreshRate();
  } catch (e) {
    debugPrint("$e");
  }
}

Future<void> initializeWithContext(BuildContext context) async {
  await Toast.initialize(context);
}
