import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lu_foundation/foundation.dart';

class PickFile {
  final String filePath;
  final String mimeType;
  final String androidUri;

  File get pickedFile => File(filePath);

  PickFile({required this.filePath, this.mimeType = "", this.androidUri = ""});
}

class LuFilePicker {
  static Future<Async<List<PickFile>>> pickMedia(BuildContext context,
      {bool allowMultiple = false}) async {
    try {
      final ImagePicker picker = ImagePicker();

      if (!allowMultiple) {
        final XFile? image = await picker.pickMedia();
        List<PickFile> data = [];
        if (image == null) {
          data = [];
          return Async.success();
        }
        data = [PickFile(filePath: image.path, mimeType: image.mimeType ?? "")];
        return Async.success(data: data);
      } else {
        final images = await picker.pickMultipleMedia();
        List<PickFile> data = [];
        if (images.isEmpty) {
          data = [];
          return Async.success();
        }
        data = images
            .map((image) =>
                PickFile(filePath: image.path, mimeType: image.mimeType ?? ""))
            .toList();
        return Async.success(data: data);
      }
    } catch (e) {
      return Async.error(message: "media select error $e");
    }
  }

  static Future<Async<List<PickFile>>> pickVideo(BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickVideo(source: ImageSource.gallery);
      List<PickFile> data = [];
      if (image == null) {
        data = [];
        return Async.success();
      }
      data = [PickFile(filePath: image.path, mimeType: image.mimeType ?? "")];
      return Async.success(data: data);
    } catch (e) {
      return Async.error(message: "video select error $e");
    }
  }

  static Future<Async<List<PickFile>>> pickImage(BuildContext context,
      {bool allowMultiple = false}) async {
    try {
      final ImagePicker picker = ImagePicker();

      if (!allowMultiple) {
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        List<PickFile> data = [];
        if (image == null) {
          data = [];
          return Async.success();
        }
        data = [PickFile(filePath: image.path, mimeType: image.mimeType ?? "")];
        return Async.success(data: data);
      } else {
        final images = await picker.pickMultiImage();
        List<PickFile> data = [];
        if (images.isEmpty) {
          data = [];
          return Async.success();
        }
        data = images
            .map((image) =>
                PickFile(filePath: image.path, mimeType: image.mimeType ?? ""))
            .toList();
        return Async.success(data: data);
      }
    } catch (e) {
      return Async.error(message: "image select error $e");
    }
  }
}
