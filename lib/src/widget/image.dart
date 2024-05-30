import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:uizakura/src/util/encrypt.dart';

class UizakuraImage extends StatefulWidget {
  final String? url;
  final String assetPath;
  final File? file;
  final Color? tintColor;
  final Color? placeholderColor;
  final ImageProvider? placeholderImage;
  final String? placeholderUrl;
  final bool cache;
  final double? size;
  final double? width;
  final double? height;
  final BaseCacheManager? cacheManager;
  final BoxFit? fit;
  final BlendMode? colorBlendMode;
  final Color? color;
  final Map<String, String>? httpHeaders;
  final Widget Function(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  )? errorWidget;

  const UizakuraImage({
    super.key,
    this.url,
    this.file,
    this.assetPath = "",
    this.tintColor,
    this.placeholderColor,
    this.placeholderImage,
    this.placeholderUrl,
    this.width,
    this.height,
    this.size,
    this.fit,
    this.httpHeaders,
    this.errorWidget,
    this.cacheManager,
    this.cache = true,
    this.colorBlendMode,
    this.color,
    ImageRenderMethodForWeb imageRenderMethodForWeb =
        ImageRenderMethodForWeb.HtmlImage,
  });

  @override
  State<StatefulWidget> createState() {
    return _State();
  }

  static setHttpClient(http.Client client) {
    _initCacheManager(client);
  }

  static void _initCacheManager([http.Client? client]) {
    _cacheManager = CacheManager(
      Config(
        _cacheKey,
        stalePeriod: const Duration(days: 30 * 2),
        maxNrOfCacheObjects: 1000,
        repo: JsonCacheInfoRepository(databaseName: _cacheKey),
        fileService: _HttpFileFetcher(httpClient: client),
      ),
    );
  }

  static const String _cacheKey = 'echo.tech.ImageCache';
  static CacheManager _cacheManager = CacheManager(
    Config(
      _cacheKey,
      stalePeriod: const Duration(days: 30 * 2),
      maxNrOfCacheObjects: 1000,
      repo: JsonCacheInfoRepository(databaseName: _cacheKey),
      fileService: _HttpFileFetcher(),
    ),
  );

  static String _md5Url(String url) {
    return EncryptUtil.md5(url);
  }

  static Future<File?> downloadUrl(String url,
      {Map<String, String>? httpHeaders}) async {
    try {
      return (await _cacheManager.downloadFile(
        url,
        key: _md5Url(url),
        authHeaders: httpHeaders,
      ))
          .file;
    } catch (e) {
      return null;
    }
  }

  static Future<File?> getFileWithUrl(String url) async {
    final res = await _cacheManager.getFileFromCache(_md5Url(url));
    return res?.file;
  }

  static Future<void> clear() async {
    await _cacheManager.emptyCache();
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
  }

  static ImageProvider _buildImageUrlProvider({
    required String url,
    Map<String, String>? httpHeaders,
    bool cache = true,
    BaseCacheManager? cacheManager,
  }) {
    final md5 = _md5Url(url);
    final cacheKey =
        !cache ? DateTime.now().millisecondsSinceEpoch.toString() : md5;
    return CachedNetworkImageProvider(
      url,
      cacheManager: cacheManager ?? UizakuraImage._cacheManager,
      headers: httpHeaders,
      cacheKey: cacheKey,
    );
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
      return Image.file(
        widget.file!,
        width: _width,
        height: _height,
        fit: widget.fit ?? BoxFit.cover,
        cacheWidth: _width != null ? _width!.toInt() * 3 : null,
      );
    }

    // assetPath
    if (widget.assetPath.isNotEmpty) {
      if (widget.assetPath.endsWith(".svg")) {
        return SvgPicture.asset(
          widget.assetPath,
          width: _width,
          colorFilter: widget.tintColor != null
              ? ColorFilter.mode(widget.tintColor!, BlendMode.srcIn)
              : null,
          height: _height,
          fit: widget.fit ?? BoxFit.contain,
        );
      }
      return Image.asset(
        widget.assetPath,
        width: _width,
        height: _height,
        color: widget.tintColor,
        colorBlendMode: BlendMode.srcIn,
        fit: widget.fit ?? BoxFit.cover,
        cacheWidth: _width != null ? _width!.toInt() * 3 : null,
      );
    }

    final url = widget.url;
    if (url == null || url.isEmpty == true) {
      return const SizedBox.shrink();
    }

    // url
    final image = UizakuraImage._buildImageUrlProvider(
      url: url,
      httpHeaders: widget.httpHeaders,
      cache: widget.cache,
      cacheManager: widget.cacheManager,
    );

    final ImageProvider transparent = MemoryImage(kTransparentImage);
    ImageProvider? placeholderImage = widget.placeholderImage;
    // url 占位优先
    if (widget.placeholderUrl != null) {
      placeholderImage = UizakuraImage._buildImageUrlProvider(
        url: widget.placeholderUrl!,
        httpHeaders: widget.httpHeaders,
        cacheManager: widget.cacheManager,
      );
    }

    final showColorPlaceholder = widget.placeholderColor != null &&
        widget.placeholderColor != Colors.transparent;

    return FadeInImage(
      image: image,
      placeholder: showColorPlaceholder
          ? transparent
          : (placeholderImage ?? transparent),
      placeholderColor:
          showColorPlaceholder ? widget.placeholderColor?.withAlpha(50) : null,
      placeholderFit: null,
      fadeInDuration: const Duration(milliseconds: 1),
      fadeOutDuration: const Duration(milliseconds: 1),
      placeholderColorBlendMode: BlendMode.color,
      placeholderFilterQuality: null,
      placeholderErrorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        debugPrint("UizakuraImage  load ${url} failed $error, $stackTrace");
        return widget.errorWidget?.call(context, error, stackTrace) ??
            const SizedBox.shrink();
      },
      width: _width,
      height: _height,
      imageSemanticLabel: url,
      fit: widget.fit ?? BoxFit.cover,
      colorBlendMode: widget.colorBlendMode,
      color: widget.color,
      imageErrorBuilder: (
        BuildContext context,
        Object error,
        StackTrace? stackTrace,
      ) {
        debugPrint("UizakuraImage  load ${url} failed $error, $stackTrace");
        return widget.errorWidget?.call(context, error, stackTrace) ??
            const SizedBox.shrink();
      },
    );
  }

  @override
  void dispose() {
    // todo cancel(_thumbnailUrl) cancel(loadUrl)
    super.dispose();
  }
}

class _HttpFileFetcher extends FileService {
  final http.Client? httpClient;
  late final http.Client _client = http.Client();

  _HttpFileFetcher({this.httpClient});

  http.Client get _httpClient {
    return httpClient ?? _client;
  }

  @override
  Future<FileServiceResponse> get(String url,
      {Map<String, String>? headers}) async {
    final http.Request req = http.Request('GET', Uri.parse(url));
    if (headers != null && headers.isNotEmpty) {
      req.headers.addAll(headers);
    }
    final http.StreamedResponse httpResponse = await _httpClient.send(req);

    return HttpGetResponse(httpResponse);
  }
}
