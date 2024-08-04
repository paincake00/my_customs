import 'package:flutter/material.dart';
import 'package:my_customs_v2/data/repository/theme_repository.dart';
import 'package:my_customs_v2/domain/enums/theme_color.dart';
import 'package:my_customs_v2/presentation/uikit/theme/app_theme_data.dart';

class ThemeController with ChangeNotifier {
  final ThemeRepository _themeRepository;

  ThemeController({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  late ThemeMode _themeMode =
      _themeRepository.getThemeMode() ?? ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  late ThemeColor _themeColor =
      _themeRepository.getThemeColor() ?? ThemeColor.purple;

  void setThemeColor(ThemeColor color) {
    _themeColor = color;

    setTheme();
  }

  late ThemeData _themeData = getThemeData();

  ThemeData get themeData => _themeData;

  ThemeData getThemeData() {
    return switch (_themeColor) {
      ThemeColor.purple => _themeMode == ThemeMode.light
          ? AppThemeData.purpleLightTheme
          : AppThemeData.purpleDarkTheme,
      ThemeColor.blue => _themeMode == ThemeMode.light
          ? AppThemeData.blueLightTheme
          : AppThemeData.blueDarkTheme,
      ThemeColor.green => _themeMode == ThemeMode.light
          ? AppThemeData.greenLightTheme
          : AppThemeData.greenDarkTheme,
      ThemeColor.orange => _themeMode == ThemeMode.light
          ? AppThemeData.orangeLightTheme
          : AppThemeData.orangeDarkTheme,
      ThemeColor.redSky => _themeMode == ThemeMode.light
          ? AppThemeData.redSkyLightTheme
          : AppThemeData.redSkyDarkTheme,
    };
  }

  Future<void> setTheme() async {
    await _themeRepository.setThemeColor(color: _themeColor);
    _themeData = getThemeData();

    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode == _themeMode) return;
    await _themeRepository.setThemeMode(mode: mode);
    _themeMode = mode;

    setTheme();
  }

  Future<void> toggleThemeMode() async {
    final newMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    setThemeMode(newMode);
  }
}
