import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lu_foundation/foundation.dart';

class _ImageManager {
  static const key = 'libCachedImageData';
  static CacheManager cacheManager = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 1000,
      repo: JsonCacheInfoRepository(databaseName: key),
      fileService: HttpFileService(),
    ),
  );

  static Future<void> removeFromCache(String? url) async {
    if (url == null || url.isEmpty) return;
    PaintingBinding.instance.imageCache.clearLiveImages();
    return cacheManager.removeFile(url);
  }

  static void clearCache() {
    _ImageManager.cacheManager.emptyCache();
  }
}

class LuImage extends StatefulWidget {
  static clear() {
    _ImageManager.clearCache();
  }

  static CacheManager get cacheManager => _ImageManager.cacheManager;

  static set cacheManager(v) {
    _ImageManager.cacheManager = v;
  }

  /// Evict an image from both the disk file based caching system of the
  /// [BaseCacheManager] as the in memory [ImageCache] of the [ImageProvider].
  /// [url] is used by both the disk and memory cache. The scale is only used
  /// to clear the image from the [ImageCache].
  static Future<void> evictFromCache(String url, {String? cacheKey}) async {
    debugPrint("evictFromCache :$url");
    try {
      _ImageManager.removeFromCache(url);
    } catch (e) {}
  }

  /// The target image that is displayed.
  final String? url;
  final Color? backgroundColor;
  final String assetPath;
  final File? file;
  final Color? tintColor;
  final Color? placeColor;

  // 每次加载不使用缓存
  final bool noCache;

  /// Widget displayed while the target [url] is loading.
  final PlaceholderWidgetBuilder? placeholder;

  /// If non-null, require the image to have this width.
  ///
  /// If null, the image will pick a size that best preserves its intrinsic
  /// aspect ratio. This may result in a sudden change if the size of the
  /// placeholder widget does not match that of the target image. The size is
  /// also affected by the scale factor.
  final double? width;

  /// If non-null, require the image to have this height.
  ///
  /// If null, the image will pick a size that best preserves its intrinsic
  /// aspect ratio. This may result in a sudden change if the size of the
  /// placeholder widget does not match that of the target image. The size is
  /// also affected by the scale factor.
  final double? height;

  /// How to inscribe the image into the space allocated during layout.
  ///
  /// The default varies based on the other fields. See the discussion at
  /// [paintImage].
  final BoxFit? fit;

  /// Optional headers for the http request of the image url
  final Map<String, String>? httpHeaders;

  /// Widget displayed while the target [url] failed loading.
  final LoadingErrorWidgetBuilder? errorWidget;

  /// Optional builder to further customize the display of the image.
  final ImageWidgetBuilder? imageBuilder;

  /// The target image's cache key.
  final String? cacheKey;

  final CachedNetworkImageProvider _image;

  CachedNetworkImageProvider get imageProvider => _image;

  /// Will resize the image and store the resized image in the disk cache.
  final int? maxWidthDiskCache;

  /// Will resize the image and store the resized image in the disk cache.
  final int? maxHeightDiskCache;

  LuImage({
    Key? key,
    this.url,
    this.file,
    this.backgroundColor,
    this.assetPath = "",
    this.tintColor,
    this.placeColor,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.httpHeaders,
    this.errorWidget,
    this.imageBuilder,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.cacheKey,
    this.noCache = false,
  })  : _image = CachedNetworkImageProvider(
          url ?? "",
          headers: httpHeaders,
          cacheManager: _ImageManager.cacheManager,
          cacheKey: cacheKey,
          maxWidth: maxWidthDiskCache,
          maxHeight: maxHeightDiskCache,
        ),
        super(
            key: key ??
                ValueKey((assetPath.isNotEmpty
                    ? assetPath
                    : file != null
                        ? file.path
                        : (url ?? ""))));

  @override
  State<StatefulWidget> createState() {
    return _CongImage();
  }
}

class _CongImage extends State<LuImage> {
  String get assetPath => widget.assetPath;

  double? get width => widget.width;

  double? get height => widget.height;

  BoxFit? get fit => widget.fit;

  String? get url => widget.url;

  Color? get backgroundColor => widget.backgroundColor;

  LoadingErrorWidgetBuilder? get errorWidget => widget.errorWidget;

  PlaceholderWidgetBuilder? get placeholder => widget.placeholder;

  Color? get placeColor => widget.placeColor;

  Map<String, String>? get httpHeaders => widget.httpHeaders;

  ImageWidgetBuilder? get imageBuilder => widget.imageBuilder;

  @override
  Widget build(BuildContext context) {
    if (widget.cacheKey?.isNotEmpty == true && widget.noCache) {
      throw const Text(
        "nocache is true but cacheKey isNotEmpty",
        style: TextStyle(backgroundColor: Colors.red, color: Colors.white),
      );
    }
    return _body(context);
  }

  @override
  void didUpdateWidget(covariant LuImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fit != fit ||
        oldWidget.width != width ||
        oldWidget.height != height ||
        oldWidget.httpHeaders != httpHeaders ||
        oldWidget.url != url ||
        oldWidget.assetPath != assetPath ||
        oldWidget.file != widget.file ||
        oldWidget.backgroundColor != widget.backgroundColor ||
        oldWidget.tintColor != widget.tintColor ||
        oldWidget.placeColor != widget.placeColor ||
        oldWidget.cacheKey != widget.cacheKey) {
      setState(() {});
    }
  }

  Widget _body(BuildContext context) {
    if (widget.file != null && widget.file!.path.isNotEmpty) {
      return Image.file(
        widget.file!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        color: widget.tintColor,
        colorBlendMode: widget.tintColor != null ? BlendMode.dstIn : null,
        cacheWidth: width != null ? width!.toInt() * 3 : null,
      );
    }
    if (assetPath.isNotEmpty) {
      if (assetPath.endsWith(".svg")) {
        return SvgPicture.asset(
          assetPath,
          width: width,
          colorFilter: widget.tintColor != null
              ? ColorFilter.mode(widget.tintColor!, BlendMode.srcIn)
              : null,
          height: height,
          fit: fit ?? BoxFit.contain,
        );
      }
      return SizedBox(
        width: width,
        height: height,
        child: Image.asset(
          assetPath,
          width: width,
          height: height,
          color: widget.tintColor,
          colorBlendMode: widget.tintColor != null ? BlendMode.dstIn : null,
          fit: fit ?? BoxFit.cover,
          cacheWidth: width != null ? width!.toInt() * 3 : null,
        ),
      );
    }

    if (url.isNullOrEmpty) {
      return defaultErrorWidget(
        context,
        "",
        null,
      );
    }
    final aUrl = url!;
    return CachedNetworkImage(
      imageUrl: aUrl,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      color: backgroundColor,
      colorBlendMode: backgroundColor != null ? BlendMode.dstOver : null,
      fadeInDuration: const Duration(milliseconds: 0),
      fadeOutDuration: const Duration(milliseconds: 0),
      placeholder: placeholder ??
          (BuildContext context, String url) {
            return (placeColor == null || placeColor == Colors.transparent
                ? defaultPlaceholderWidget(context, url)
                : buildColorPlaceholderWidget(context, placeColor));
          },
      cacheManager: _ImageManager.cacheManager,
      httpHeaders: httpHeaders,
      // 只能设置一个 memCacheWidth，不然会变形，3倍效果最合适，不然会糊
      memCacheWidth: width == null ? null : ((width?.toInt() ?? 0) * 4),
      errorWidget: errorWidget ?? defaultErrorWidget,
      imageBuilder: imageBuilder,
      cacheKey: widget.cacheKey ??
          (widget.noCache ? DateTime.now().toString() : aUrl),
    );
  }

  Widget defaultErrorWidget(
    BuildContext context,
    String url,
    dynamic error,
  ) =>
      Container(
        width: width,
        height: height,
        color: Colors.black12,
        foregroundDecoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(0),
        ),
        child: const Text("加载失败"),
      );

  Widget defaultPlaceholderWidget(
    BuildContext context,
    String url,
  ) =>
      Container(
        width: width,
        height: height,
        color: Colors.black12,
        foregroundDecoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(0),
        ),
      );

  Widget buildColorPlaceholderWidget(
    BuildContext context,
    Color? color,
  ) =>
      Container(
        width: width,
        height: height,
        color: color?.withAlpha(50),
        child: LuAppEnv.isDebug ? Text("${color?.toString()}") : null,
      );

  @override
  void dispose() {
    super.dispose();
    //debugPrint("conimage $url $resize dispose");
  }
}
