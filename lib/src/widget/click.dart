import 'package:flutter/widgets.dart';

/// @author luwenjie on 2023/12/16 23:12:03

class Clickable extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;

  const Clickable({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: child,
    );
  }
}
