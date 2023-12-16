import 'package:flutter/cupertino.dart';

import 'foundation.dart';

/// @author luwenjie on 2023/9/15 00:11:57

export "src/toast.dart";
export "src/util/env.dart";
export "src/util/file.dart";
export "src/util/string_extension.dart";
export "src/util/widget_extension.dart";
export "src/util/file_picker.dart";
export "src/page/base_page.dart";
export "src/page/view_model.dart";
export 'src/page/paging.dart';
export "src/async_state/async_state.dart";
export "src/widget/image.dart";
export "src/widget/after_layout.dart";
export "src/widget/overlay.dart";
export "src/widget/click.dart";
export "src/util/color.dart";
export "src/lifecycle/lifecycle.dart";
export "src/lifecycle/state.dart";
export "src/lifecycle/observer.dart";

Future<void> initialize() async {
  await appEnv.init();
}

Future<void> initializeWithContext(BuildContext context) async {
  await Toast.initialize(context);
}
