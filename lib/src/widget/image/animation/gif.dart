///
/// * author: Pierluigi Zagaria
/// * email: pierluigizagaria@gmail.com
///
/// A package provides an easy way to manage Gifs with animation controllers
///

library gif;

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import 'controller.dart';

Client? _sharedHttpClient;

Client get _httpClient {
  _sharedHttpClient ??= Client();
  Client client = _sharedHttpClient!;
  return client;
}

///
/// A widget that renders a Gif controllable with [AnimationController].
///
@immutable
class UizakuraGif extends StatefulWidget {
  /// [ImageProvider] of this gif. Like [NetworkImage], [AssetImage], [MemoryImage]
  final ImageProvider? image;

  /// This playback controller.
  final GifAnimationController? controller;

  final String? url;

  /// Rendered when gif frames fetch is still not completed.
  final Widget Function(BuildContext context)? placeholder;

  /// Called when gif frames fetch is completed.
  final VoidCallback? onFetchCompleted;

  final double? width;
  final double? height;

  final int? cacheWidth;
  final int? cacheHeight;

  final Color? color;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final Rect? centerSlice;
  final bool matchTextDirection;
  final String? semanticLabel;
  final Map<String, String>? headers;
  final bool excludeFromSemantics;

  /// Creates a widget that displays a controllable gif.
  ///
  /// [fps] frames per second at which this should be rendered.
  ///
  /// [duration] whole playback duration for this gif.
  ///
  /// [autostart] if and how to start this gif. Defaults to [Autostart.no].
  ///
  /// [placeholder] this widget is rendered during the gif frames fetch.
  ///
  /// [onFetchCompleted] is called when the frames fetch finishes and the gif can be
  /// rendered.
  ///
  /// Only one of the two can be set: [fps] or [duration]
  /// If [controller.duration] and [fps] are not specified, the original gif
  /// framerate will be used.
  const UizakuraGif({
    super.key,
    this.image,
    this.controller,
    this.placeholder,
    this.onFetchCompleted,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.color,
    this.colorBlendMode,
    this.fit,
    this.headers,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.url,
  });

  @override
  State<UizakuraGif> createState() => _UizakuraGifState();
}

class _UizakuraGifState extends State<UizakuraGif>
    with SingleTickerProviderStateMixin {
  late final GifAnimationController _controller;

  /// List of [ImageInfo] of every frame of this gif.
  List<ImageInfo> _frames = [];

  int _frameIndex = 0;

  /// Current rendered frame.
  ImageInfo? get _frame =>
      _frames.length > _frameIndex ? _frames[_frameIndex] : null;

  @override
  Widget build(BuildContext context) {
    final RawImage image = RawImage(
      image: _frame?.image,
      width: widget.width,
      height: widget.height,
      scale: _frame?.scale ?? 1.0,
      color: widget.color,
      colorBlendMode: widget.colorBlendMode,
      fit: widget.fit,
      alignment: widget.alignment,
      repeat: widget.repeat,
      centerSlice: widget.centerSlice,
      matchTextDirection: widget.matchTextDirection,
    );
    return widget.placeholder != null && _frame == null
        ? widget.placeholder!(context)
        : widget.excludeFromSemantics
            ? image
            : Semantics(
                container: widget.semanticLabel != null,
                image: true,
                label: widget.semanticLabel ?? '',
                child: image,
              );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadFrames().then((value) => _autostart());
  }

  @override
  void didUpdateWidget(UizakuraGif oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_listener);
      _controller = widget.controller ?? GifAnimationController(vsync: this);
      _controller.addListener(_listener);
    }
    if ((widget.url != oldWidget.url)) {
      _autostart();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? GifAnimationController(vsync: this);
    _controller.addListener(_listener);

    assert(
      _controller.fps == null || _controller.duration == null,
      'only one of the two can be set [fps] [duration]',
    );
    assert(_controller.fps == null || (_controller.fps ?? 0) > 0,
        'fps must be greater than 0');
  }

  /// Start this gif according to [widget.autostart] and [widget.loop].
  void _autostart() {
    if (mounted && _controller.autoPlay) {
      _controller.reset();
      if (_controller.loop) {
        _controller.repeat();
      } else {
        _controller.forward();
      }
    }
  }

  /// Get unique image string from [ImageProvider]
  String _getImageKey(ImageProvider? provider) {
    return widget.url ??
        (provider is NetworkImage
            ? provider.url
            : provider is AssetImage
                ? provider.assetName
                : provider is FileImage
                    ? provider.file.path
                    : provider is MemoryImage
                        ? provider.bytes.toString()
                        : "");
  }

  /// Calculates the [_frameIndex] based on the [AnimationController] value.
  ///
  /// The calculation is based on the frames of the gif
  /// and the [Duration] of [AnimationController].
  void _listener() {
    if (_frames.isNotEmpty && mounted) {
      setState(() {
        _frameIndex = _frames.isEmpty
            ? 0
            : ((_frames.length - 1) * _controller.value).floor();
      });
    }
  }

  /// Fetches the frames with [_fetchFrames] and saves them into [_frames].
  ///
  /// When [_frames] is updated [onFetchCompleted] is called.
  Future<void> _loadFrames() async {
    if (!mounted) return;
    final key = _getImageKey(widget.image);
    EchoImageFrame? gif;
    if (_controller.useCache) {
      gif = GifAnimationController.caches.getItem(key);
    }
    gif ??= await _fetchFrames(widget.image);
    if (!mounted) return;
    if (_controller.useCache) {
      GifAnimationController.caches.putItem(key, gif);
    }

    setState(() {
      _frames = gif!.frames;
      _controller.duration = _controller.fps != null
          ? Duration(
              milliseconds: (_frames.length / _controller.fps! * 1000).round())
          : _controller.duration ?? gif.duration;

      if ((_controller.duration?.inMilliseconds ?? 0) <= 0) {
        _controller.duration =
            Duration(milliseconds: (_frames.length / 12 * 1000).round());
      }
      if (widget.onFetchCompleted != null) {
        widget.onFetchCompleted!();
      }
    });
  }

  /// Fetches the single gif frames and saves them into the [FrameCache] of [UizakuraGif]
  Future<EchoImageFrame> _fetchFrames(ImageProvider? provider) async {
    Uint8List bytes = Uint8List(0);
    if (widget.url != null && widget.url!.isNotEmpty) {
      final Uri resolved = Uri.base.resolve(widget.url!);
      final Response response = await _httpClient.get(
        resolved,
        headers: widget.headers,
      );
      bytes = response.bodyBytes;
    } else if (provider is NetworkImage) {
      final Uri resolved = Uri.base.resolve(provider.url);
      final Response response = await _httpClient.get(
        resolved,
        headers: provider.headers,
      );
      bytes = response.bodyBytes;
    } else if (provider is AssetImage) {
      AssetBundleImageKey key =
          await provider.obtainKey(const ImageConfiguration());
      bytes = (await key.bundle.load(key.name)).buffer.asUint8List();
    } else if (provider is FileImage) {
      bytes = await provider.file.readAsBytes();
    } else if (provider is MemoryImage) {
      bytes = provider.bytes;
    }

    final buffer = await ImmutableBuffer.fromUint8List(bytes);
    Codec codec = await PaintingBinding.instance.instantiateImageCodecWithSize(
      buffer,
      getTargetSize: (int intrinsicWidth, int intrinsicHeight) {
        final maxWidth = widget.cacheWidth;
        final maxHeight = widget.cacheHeight;
        if (maxWidth != null && maxWidth > intrinsicWidth) {
          return const TargetImageSize();
        }
        if (maxHeight != null && maxHeight > intrinsicHeight) {
          return const TargetImageSize();
        }
        if (maxWidth != null && maxHeight != null) {
          double ratio = intrinsicWidth * 1.0 / intrinsicHeight;
          return TargetImageSize(
            width: maxWidth,
            height: (maxWidth / ratio).toInt(),
          );
        }
        return TargetImageSize(
          width: maxWidth,
          height: maxHeight,
        );
      },
    );
    List<ImageInfo> infos = [];
    Duration duration = const Duration();

    for (int i = 0; i < codec.frameCount; i++) {
      FrameInfo frameInfo = await codec.getNextFrame();
      infos.add(ImageInfo(image: frameInfo.image));
      duration += frameInfo.duration;
    }

    return EchoImageFrame(frames: infos, duration: duration);
  }
}
