import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:wen_foundation/src/util/string_extension.dart';

import 'env.dart';

/// @author luwenjie on 2023/9/14 23:11:19

class FileUtil {
  FileUtil._();

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

  // static Future<bool> saveImageWithPath(String path, {String? title}) async {
  // await PermissionUtil.requestMedia();
  // if (appEnv.isAndroid) {
  //   try {
  //     await ImageGallerySaver.saveFile(path, name: title, folder: "LinJie");
  //   } catch (e) {
  //     return false;
  //   }
  //   return true;
  // } else {
  //   try {
  //     final ph = await PhotoManager.requestPermissionExtend();
  //     if (ph.isAuth) {
  //       await PhotoManager.editor
  //           .saveImageWithPath(path, title: path.substringAfterLast("/"));
  //     } else {
  //       // 这个无法保存 gif
  //       await ImageGallerySaver.saveFile(path);
  //     }
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }
  // }

  // static Future<void> clearCache() async {
  //   (await getImageCacheDirectory()).delete(recursive: true);
  //   await clearPhotoManagerCache();
  // }
  //
  // static clearPhotoManagerCache() async {
  //   try {
  //     await PhotoManager.clearFileCache();
  //   } catch (e) {
  //     //
  //   }
  // }

  static getType(String path) {
    final name = path.substringAfterLast('/');
    String type = "jpeg";
    if (name.contains(".")) {
      type = name.substringAfterLast(".");
    }
    if (type.contains("!lfit") || type.contains("!mfit")) {
      return "jpeg";
    }
    return type;
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
