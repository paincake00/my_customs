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

  // ThemeColor _themeColor = ThemeColor.purple;

  // void setThemeColor(ThemeColor color) {
  //   _themeColor = color;
  //   notifyListeners();
  // }

  // ThemeData _themeData = AppThemeData.purpleLightTheme;

  // ThemeData get themeData => setTheme();

  // ThemeData setTheme() {
  //   switch (_themeColor) {
  //     case ThemeColor.purple:
  //       return _themeMode == ThemeMode.light
  //           ? AppThemeData.purpleLightTheme
  //           : AppThemeData.purpleDarkTheme;
  //     case ThemeColor.blue:
  //       return _themeMode == ThemeMode.light
  //           ? AppThemeData.blueLightTheme
  //           : AppThemeData.blueDarkTheme;
  //   }
  // }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode == _themeMode) return;
    await _themeRepository.setThemeMode(mode: mode);
    _themeMode = mode;
    notifyListeners();
  }

  Future<void> toggleThemeMode() async {
    final newMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    setThemeMode(newMode);
  }
}
