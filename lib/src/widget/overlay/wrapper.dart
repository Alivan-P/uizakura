// @author luwenjie on 2024/8/28 21:46:02

import 'package:flutter/widgets.dart';

import 'anim.dart';

class OverLayWrapper extends StatefulWidget {
  final Widget child;
  final OverLayAnimation? animation;
  final ValueNotifier<bool> visibleNotifier;

  const OverLayWrapper({
    super.key,
    required this.child,
    this.animation,
    required this.visibleNotifier,
  });

  @override
  State<StatefulWidget> createState() {
    return _OverLayWrapperState();
  }
}

class _OverLayWrapperState extends State<OverLayWrapper>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _dismissController;
  Animation<double>? _animation;
  Animation<double>? _dismissAnimation;

  @override
  void initState() {
    super.initState();
    widget.visibleNotifier.addListener(() async {
      final anim = widget.animation;
      if (anim != null) {
        if (widget.visibleNotifier.value == true) {
          await showAnimation();
        } else {
          await dismissAnimation();
        }
      }
    });
    if (widget.animation != null) {
      _controller = AnimationController(
        duration: widget.animation!.showDuration,
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        reverseDuration: widget.animation!.dismissDuration,
      );
      _dismissController = AnimationController(
        duration: widget.animation!.showDuration,
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        reverseDuration: widget.animation!.dismissDuration,
      );
      showAnimation();
    }
  }

  Future<void> showAnimation() async {
    if (widget.animation != null) {
      _animation = CurvedAnimation(
        parent: _controller!,
        curve: widget.animation!.showCurve,
      );
      try {
        await _controller!.forward();
      } catch (e) {
        //
      }
    }
  }

  Future<void> dismissAnimation() async {
    if (widget.animation == null) return;
    try {
      _dismissAnimation = CurvedAnimation(
        parent: _dismissController!,
        curve: widget.animation!.dismissCurve,
      );
      setState(() {});
      await _dismissController!.reverse(from: 1);
    } catch (e) {
      //
    }
  }

  @override
  void didUpdateWidget(covariant OverLayWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animation != null) {
      return _dismissAnimation != null
          ? FadeTransition(
              opacity: _dismissAnimation!,
              child: widget.child,
            )
          : FadeTransition(
              opacity: _animation!,
              child: widget.child,
            );
    } else {
      return widget.child;
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _dismissController?.dispose();
    super.dispose();
  }
}
