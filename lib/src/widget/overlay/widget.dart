// @author luwenjie on 2024/8/28 21:44:31

// @author luwenjie on 2024/8/27 13:45:49

import 'dart:async';

import 'package:flutter/material.dart';

import 'anim.dart';
import 'wrapper.dart';

class OverLayView extends StatefulWidget {
  final Widget child;
  final Widget overLayer;
  final Duration? duration;
  final EdgeInsetsGeometry? padding;
  final OverLayAnimation? animation;
  final Function()? onTapOutside;
  final OverLayController? controller;

  final Alignment alignment;

  const OverLayView({
    super.key,
    required this.child,
    this.padding,
    this.alignment = Alignment.topLeft,
    this.controller,
    this.onTapOutside,
    required this.overLayer,
    this.duration,
    this.animation = const OverLayAnimation(
      showDuration: Duration(milliseconds: 200),
      dismissDuration: Duration(milliseconds: 200),
    ),
  });

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<OverLayView> {
  late final OverLayController _controller =
      widget.controller ?? OverLayController();
  late Duration? _duration = widget.duration;
  Timer? _timer;
  late ValueNotifier<bool> _visibleNotifier;

  @override
  void didUpdateWidget(covariant OverLayView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _init();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    _visibleNotifier = _controller._visibleNotifier;
    _visibleNotifier.addListener(() async {
      final anim = widget.animation;
      if (anim != null) {
        if (!_visibleNotifier.value) {
          await Future.delayed(anim.dismissDuration);
        }
      }
      if (_visibleNotifier.value) {
        if (_duration != null) {
          _timer?.cancel();
          _timer = Timer.periodic(_duration!, (t) {
            _timer?.cancel();
            _visibleNotifier.value = false;
          });
        }
      }
      setState(() {});
    });
    _duration = widget.duration;
    _timer?.cancel();
    if (_duration != null) {
      _timer = Timer.periodic(_duration!, (t) {
        _timer?.cancel();
        _visibleNotifier.value = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(_visibleNotifier.value);
  }

  Widget _buildBody(bool visible) {
    return Stack(
      children: [
        widget.child,
        if (visible)
          OverLayWrapper(
              animation: widget.animation,
              visibleNotifier: _visibleNotifier,
              child: widget.onTapOutside == null
                  ? _buildItem(widget.overLayer)
                  : GestureDetector(
                      onTap: widget.onTapOutside,
                      behavior: HitTestBehavior.opaque,
                      child: _buildItem(widget.overLayer),
                    )),
      ],
    );
  }

  Widget _buildItem(Widget e) {
    return Container(
        padding: widget.padding,
        alignment: widget.alignment,
        child: GestureDetector(
          onTap: () {
            //
          },
          behavior: HitTestBehavior.opaque,
          child: e,
        ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller._dispose();
    super.dispose();
  }
}

class OverLayController {
  final ValueNotifier<bool> _visibleNotifier = ValueNotifier(false);

  OverLayController();

  bool get isShowing {
    return _visibleNotifier.value;
  }

  show() {
    _visibleNotifier.value = true;
  }

  dismiss() {
    _visibleNotifier.value = false;
  }

  void _dispose() {
    _visibleNotifier.dispose();
  }
}
