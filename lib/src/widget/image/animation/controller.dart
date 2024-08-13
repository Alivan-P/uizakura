import 'dart:collection';

import 'package:flutter/material.dart';

class GifAnimationController extends AnimationController {
  /// Rendered gifs cache.
  static FrameCache caches = FrameCache();

  final bool autoPlay;
  final bool useCache;
  bool loop;

  /// Frames per second at which this runs.
  final int? fps;

  GifAnimationController({
    required super.vsync,
    this.autoPlay = true,
    this.loop = true,
    this.fps,
    super.duration,
    super.reverseDuration,
    super.debugLabel,
    super.lowerBound,
    super.upperBound,
    super.value,
    super.animationBehavior,
    this.useCache = true,
  });
}

///
/// Works as a cache system for already fetched [EchoImageFrame].
///
@immutable
class FrameCache {
  final maxLength = 10;

  final LinkedHashMap<String, EchoImageFrame> caches = LinkedHashMap();

  /// Clears all the stored gifs from the cache.
  void clear() => caches.clear();

  /// Removes single gif from the cache.
  bool evict(Object key) => caches.remove(key) != null ? true : false;

  EchoImageFrame? getItem(String key) {
    return caches[key];
  }

  void putItem(String key, EchoImageFrame frame) {
    if (caches.length > maxLength) {
      caches.remove(caches.values.first);
    }
    caches[key] = frame;
  }
}

@immutable
class EchoImageFrame {
  final List<ImageInfo> frames;
  final Duration duration;

  const EchoImageFrame({
    required this.frames,
    required this.duration,
  });
}
