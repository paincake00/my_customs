import 'package:flutter/material.dart';
import 'package:my_customs_v2/data/storage/theme/theme_storage.dart';

class ThemeRepository {
  final ThemeStorage _themeStorage;

  ThemeRepository({
    required ThemeStorage themeStorage,
  }) : _themeStorage = themeStorage;

  ThemeMode? getThemeMode() {
    return _themeStorage.getThemeMode();
  }

  Future<void> setThemeMode({
    required ThemeMode mode,
  }) async {
    await _themeStorage.setThemeMode(mode: mode);
  }
}
