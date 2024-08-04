import 'package:flutter/material.dart';
import 'package:my_customs_v2/data/storage/theme/theme_storage.dart';
import 'package:my_customs_v2/domain/enums/theme_color.dart';

class ThemeRepository {
  final ThemeStorage _themeStorage;

  ThemeRepository({
    required ThemeStorage themeStorage,
  }) : _themeStorage = themeStorage;

  ThemeColor? getThemeColor() {
    return _themeStorage.getThemeColor();
  }

  Future<void> setThemeColor({
    required ThemeColor color,
  }) async {
    await _themeStorage.setThemeColor(color: color);
  }

  ThemeMode? getThemeMode() {
    return _themeStorage.getThemeMode();
  }

  Future<void> setThemeMode({
    required ThemeMode mode,
  }) async {
    await _themeStorage.setThemeMode(mode: mode);
  }
}
