import 'package:flutter/material.dart';

class NonBlockingLoading {
  static OverlayEntry? _overlayEntry;
  static bool get isShowing => _overlayEntry != null;

  static void show(BuildContext context, {String? text}) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (_) => _LoadingOverlay(text: text),
    );

    Overlay.of(context, rootOverlay: true)?.insert(_overlayEntry!);
  }

  static void dismiss() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class _LoadingOverlay extends StatelessWidget {
  final String? text;

  const _LoadingOverlay({this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 半透明点击穿透背景
        IgnorePointer(
          child: Container(
            color: Colors.transparent,
          ),
        ),
        Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  if (text != null && text!.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    Text(
                      text!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
