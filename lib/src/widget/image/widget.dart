import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uizakura/src/util/encrypt.dart';

import 'animation/controller.dart';

const _maxCache = Duration(days: 60);

/// 支持加载 asset/file/url/[KurilIcons] 图片
/// 支持控制 gif 进度 []
class UizakuraImage extends StatefulWidget {
  final String? url;
  final String assetPath;
  final File? file;
  final Widget? Function()? placeholderBuilder;
  final Widget? Function()? errorBuilder;
  final bool cache;
  final double? size;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final BlendMode? colorBlendMode;
  final Color? color;
  final GifAnimationController? animationController;
  final Map<String, String>? httpHeaders;
  final Widget Function(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  )? errorWidget;

  const UizakuraImage({
    Key? key,
    this.url,
    this.file,
    this.assetPath = "",
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.size,
    this.fit,
    this.animationController,
    this.httpHeaders,
    this.errorWidget,
    this.cache = true,
    this.colorBlendMode,
    this.color,
    this.placeholderBuilder,
    this.errorBuilder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }

  static String getUrlKey(String url) {
    return EncryptUtil.md5(url);
  }

  static ImageProvider buildNetworkImageProvider({
    required String url,
    double? width,
    double? height,
    int? cacheWidth,
    int? cacheHeight,
    bool cache = true,
    String? cacheKey,
    Map<String, String>? headers,
  }) {
    return ExtendedImage.network(
      url,
      cacheKey: cacheKey ?? getUrlKey(url),
      width: width,
      height: height,
      retries: 0,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      cache: cache,
      cacheMaxAge: _maxCache,
      headers: headers,
    ).image;
  }

  static Future<void> downloadUrl(
      {required BuildContext context,
      required String url,
      String? cacheKey,
      Map<String, String>? httpHeaders}) async {
    try {
      await precacheImage(
        buildNetworkImageProvider(
          url: url,
          headers: httpHeaders,
          cacheKey: cacheKey,
        ),
        context,
      );
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<File?> getUrlFileCache(
    String url, {
    String? cacheKey,
  }) async {
    return await getCachedImageFile(
      url,
      cacheKey: cacheKey ?? getUrlKey(url),
    );
  }

  static Future<bool> removeUrlCache(
    String url, {
    String? cacheKey,
  }) async {
    final key = cacheKey ?? getUrlKey(url);
    clearMemoryImageCache(key);
    return clearDiskCachedImage(url, cacheKey: key);
  }

  static Future<void> clearCache() async {
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
    clearDiskCachedImages();
  }
}

class _State extends State<UizakuraImage> {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  @override
  void didUpdateWidget(covariant UizakuraImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fit != widget.fit ||
        oldWidget.width != widget.width ||
        oldWidget.height != widget.height ||
        oldWidget.size != widget.size ||
        oldWidget.assetPath != widget.assetPath) {
      setState(() {});
    }
  }

  double? get _width => widget.size ?? widget.width;

  double? get _height => widget.size ?? widget.height;

  Widget _body(BuildContext context) {
    // file
    if (widget.file != null && widget.file!.path.isNotEmpty) {
      return Container(
        width: _width,
        height: _height,
        alignment: Alignment.center,
        child: Image.file(
          widget.file!,
          width: _width,
          height: _height,
          fit: widget.fit ?? BoxFit.scaleDown,
          color: widget.color,
          colorBlendMode: widget.colorBlendMode,
          cacheWidth: _width != null ? _width!.toInt() * 3 : null,
        ),
      );
    }

    // assetPath
    if (widget.assetPath.isNotEmpty) {
      if (widget.assetPath.endsWith(".svg")) {
        return Container(
          width: _width,
          height: _height,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            widget.assetPath,
            width: _width,
            colorFilter: widget.color != null
                ? ColorFilter.mode(
                    widget.color!, widget.colorBlendMode ?? BlendMode.srcIn)
                : null,
            height: _height,
            fit: widget.fit ?? BoxFit.scaleDown,
          ),
        );
      }
      return Container(
        width: _width,
        height: _height,
        alignment: Alignment.center,
        child: Image.asset(
          widget.assetPath,
          width: _width,
          height: _height,
          color: widget.color,
          colorBlendMode: widget.colorBlendMode ?? BlendMode.srcIn,
          fit: widget.fit ?? BoxFit.scaleDown,
          cacheWidth: _width != null ? _width!.toInt() * 3 : null,
        ),
      );
    }

    final url = widget.url;

    // all res is null
    if (url == null || url.isEmpty == true) {
      return widget.placeholderBuilder?.call() ?? const SizedBox.shrink();
    }

    // url
    return Container(
      alignment: Alignment.center,
      width: _width,
      height: _height,
      child: ExtendedImage.network(
        url,
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return widget.placeholderBuilder?.call();
            case LoadState.completed:
              break;
            case LoadState.failed:
              return widget.errorBuilder?.call();
          }
          return null;
        },
        width: _width,
        height: _height,
        cacheWidth: widget.cacheWidth,
        cacheHeight: widget.cacheHeight,
        fit: widget.fit ?? BoxFit.cover,
        color: widget.color,
        colorBlendMode: widget.colorBlendMode,
        retries: 1,
        cache: widget.cache,
        cacheKey: UizakuraImage.getUrlKey(url),
        printError: false,
        cacheMaxAge: _maxCache,
      ),
    );
  }

  @override
  void dispose() {
    // todo cancel(_thumbnailUrl) cancel(loadUrl)
    super.dispose();
  }
}
