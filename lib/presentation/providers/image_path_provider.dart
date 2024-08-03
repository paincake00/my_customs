import 'package:flutter/material.dart';

class ImagePathProvider with ChangeNotifier {
  late final String _appDirPath;

  ImagePathProvider({
    required String appDirPath,
  }) : _appDirPath = appDirPath;

  String? _image;

  String? get image => _image;

  String get appDirPath => _appDirPath;

  void setImage(String? image) {
    _image = image;
    notifyListeners();
  }
}
