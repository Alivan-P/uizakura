import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wen_foundation/foundation.dart';

/// @author luwenjie on 2023/10/22 14:21:48

Center loadingView({Size? size}) => Center(
      child: SizedBox.fromSize(
        size: size ?? const Size.square(30),
        child: const CircularProgressIndicator(),
      ),
    );

RouteSettings get loadingRouteSettings => const RouteSettings(
      name: "/loading",
    );

showLoadingDialog(BuildContext context,
    {Widget? child, bool barrierDismissible = true}) {
  showDialog(
      context: context,
      routeSettings: loadingRouteSettings,
      useRootNavigator: false,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return child ?? loadingView();
      });
}

dismissLoadingDialog(BuildContext context) {
  NavigatorState navigator = Navigator.of(context, rootNavigator: false);
  final current = ModalRoute.of(context)?.settings;
  if (current == loadingRouteSettings) {
    navigator.pop();
  }
}
