import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:uizakura/src/util/string_extension.dart';

/// @author luwenjie on 2023/9/14 23:11:19

class UizakuraFileUtil {
  UizakuraFileUtil._();

  static Future<Directory> getDbDirectory() async {
    Directory support = await getApplicationSupportDirectory();
    if (!support.existsSync()) {
      throw Exception("getdatebaseDirectory error");
    }
    final datebase = Directory("${support.path}/datebase");
    datebase.createSync();
    return datebase;
  }

  static Future<Directory> getImageCacheDirectory() async {
    Directory tempDir = await getTemporaryDirectory();
    if (!tempDir.existsSync()) {
      throw Exception("getTemporaryDirectory error");
    }
    final image = Directory("${tempDir.path}/image");
    image.createSync();
    return image;
  }

  static getName(String path) {
    String name = path.substringAfterLast('/');
    if (name.isEmpty) {
      return path;
    }
    if (name.contains(".")) {
      name = name.substringBeforeLast(".");
    }
    return name;
  }
}
