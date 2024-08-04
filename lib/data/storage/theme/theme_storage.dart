import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_customs_v2/domain/enums/theme_color.dart';
import 'package:my_customs_v2/domain/enums/theme_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  final SharedPreferences _prefs;

  ThemeStorage({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  ThemeColor? getThemeColor() {
    final color = _prefs.getString(ThemeStorageKeys.color.key);

    if (color != null) {
      return ThemeColor.values.firstWhereOrNull(
        (themeColor) => themeColor.name == color,
      );
    }
    return null;
  }

  Future<void> setThemeColor({
    required ThemeColor color,
  }) async {
    await _prefs.setString(
      ThemeStorageKeys.color.key,
      color.name,
    );
  }

  ThemeMode? getThemeMode() {
    final mode = _prefs.getString(ThemeStorageKeys.mode.key);

    if (mode != null) {
      return ThemeMode.values.firstWhereOrNull(
        (themeMode) => themeMode.name == mode,
      );
    }
    return null;
  }

  Future<void> setThemeMode({
    required ThemeMode mode,
  }) async {
    await _prefs.setString(
      ThemeStorageKeys.mode.key,
      mode.name,
    );
  }
}
