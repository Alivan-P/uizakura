/// @author luwenjie on 2024/6/8 23:12:46

/// @author luwenjie on 2023/11/13 17:18:11

import 'package:flutter/material.dart';
import 'package:uizakura/uizakura.dart';

import 'measure_size.dart';

/// @author luwenjie on 2023/11/13 15:58:06
///

class DropdownOverlayController {
  final _overlayManager = OverlayManager();
  AnimationController? _animController;
  Animation<double>? _animation;
  bool _dismissFlag = false;
  _State? _state;
  bool isShowing = false;

  dismiss() {
    isShowing = false;
    _dismissFlag = true;
    _animController?.animateTo(0);
    _state?.widget.onVisibleChanged?.call(false);
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: _animation!.value,
          child: Container(
            height: (_state!._popSize?.height ?? 0) * _animation!.value,
            color: _state!.widget.maskColor ??
                const Color(0xFF000000).withOpacity(0.7),
          ),
        ),
        Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            clipBehavior: Clip.hardEdge,
            height: (_state!._popSize?.height ?? 0) * _animation!.value,
            child: _state!.widget.dropdownBuilder.call(context)),
      ],
    );
  }

  show() {
    if (_state == null) return;
    if (_animController == null) return;
    if (_animation == null) return;
    isShowing = true;
    _dismissFlag = false;
    final context = _state!.context;
    _overlayManager.show(
      _state!.context,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          dismiss();
        },
        child: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          alignment: Alignment.topLeft,
          child: AnimatedBuilder(
            builder: (BuildContext context, Widget? child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: _state!.widget.reverse
                    ? [
                        // mask
                        Expanded(
                          child: Opacity(
                            opacity: _animation!.value,
                            child: Container(
                              color: _state!.widget.maskColor ??
                                  const Color(0xFF000000).withOpacity(0.7),
                            ),
                          ),
                        ),
                        _buildContent(context),
                        Offstage(
                          offstage: true,
                          child: MeasureSize(
                              onChange: (Size size) {
                                _state!._popSize = size;
                              },
                              child:
                                  _state!.widget.dropdownBuilder.call(context)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height -
                              _state!._key.globalOffset.dy +
                              (_state!.widget.offset?.dy ?? 0),
                        ),
                      ]
                    : [
                        SizedBox(
                          height: _state!._key.globalOffset.dy +
                              _state!._key.renderBox.size.height +
                              (_state!.widget.offset?.dy ?? 0),
                        ),
                        Offstage(
                          offstage: true,
                          child: MeasureSize(
                              onChange: (Size size) {
                                _state!._popSize = size;
                              },
                              child:
                                  _state!.widget.dropdownBuilder.call(context)),
                        ),
                        _buildContent(context),
                        // mask
                        Expanded(
                          child: Opacity(
                            opacity: _animation!.value,
                            child: Container(
                              color: _state!.widget.maskColor ??
                                  const Color(0xFF000000).withOpacity(0.7),
                            ),
                          ),
                        )
                      ],
              );
            },
            animation: _animation!,
          ),
        ),
      ),
    );
    _state!.widget.onVisibleChanged?.call(true);
    _animController?.animateTo(1);
  }

  void _init(_State state) {
    _state = state;
    _animController = AnimationController(
      vsync: state,
      duration: state.widget.animDuration ?? const Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _animController!,
      curve: Curves.easeInCubic,
    );
    _animController?.addListener(() {
      if (_animController?.value == 0 && _dismissFlag) {
        _overlayManager.dismiss();
        _dismissFlag = false;
      }
    });
  }

  void dispose() {
    _animController?.dispose();
    _animController = null;
    _animation = null;
    _state = null;
    _overlayManager.dismiss();
  }
}

class DropdownOverlay extends StatefulWidget {
  final Widget child;
  final WidgetBuilder dropdownBuilder;
  final DropdownOverlayController? controller;
  final Color? maskColor;
  final Duration? animDuration;
  final bool reverse;
  final Radius? radius;
  final Offset? offset;

  final Function(bool visible)? onVisibleChanged;

  const DropdownOverlay(
      {super.key,
      this.maskColor,
      required this.child,
      this.onVisibleChanged,
      this.radius,
      this.offset,
      this.controller,
      this.reverse = false,
      this.animDuration,
      required this.dropdownBuilder});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<DropdownOverlay>
    with SingleTickerProviderStateMixin {
  late final DropdownOverlayController _controller =
      widget.controller ?? DropdownOverlayController();
  final GlobalKey _key = GlobalKey();

  Size? _popSize;

  @override
  void initState() {
    super.initState();
    _controller._init(this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _controller.show();
        },
        child: Container(key: _key, child: widget.child));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
