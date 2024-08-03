import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageHandler {
  static Widget renderImage({
    required String? name,
    required String appDirPath,
  }) {
    if (name != null) {
      if (File('$appDirPath/$name').existsSync()) {
        return Image.memory(
          File('$appDirPath/$name').readAsBytesSync(),
          fit: BoxFit.cover,
        );
      }
    }
    // if (path != null) {
    //   if (File(path).existsSync()) {
    //     return Image.file(
    //       File(path).absolute,
    //       fit: BoxFit.cover,
    //     );
    //   }
    // }
    return const Center(
      child: Icon(
        Icons.add_photo_alternate_outlined,
        size: 30,
      ),
    );
  }

  static Future pickImageFromGallery({
    required String appDirPath,
  }) async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (returnedImage == null) return;

    File image = File(returnedImage.path);

    final File localImage =
        await image.copy('$appDirPath/${returnedImage.name}');

    return returnedImage;
  }

  static Future<void> deleteImageFormAppDir({
    required String? name,
    required String appDirPath,
  }) async {
    File? localImage = File('$appDirPath/$name');

    if (name != null) {
      if (localImage.existsSync()) {
        await localImage.delete();
      }
    }
  }
}
