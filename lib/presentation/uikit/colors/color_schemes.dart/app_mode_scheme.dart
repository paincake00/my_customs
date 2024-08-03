import 'package:flutter/material.dart';
import 'package:my_customs_v2/presentation/uikit/colors/color_palette.dart';

class AppModeScheme extends ThemeExtension<AppModeScheme> {
  final Color backgroundPage;
  final Color backgroundBar;
  final Color borderBar;
  final Color iconMain;
  final Color textSort;
  final Color textSearch;
  final Color delete;
  final Color archiveStart;
  final Color archiveEnd;

  AppModeScheme.light()
      : backgroundPage = LightColorPalette.backgroundPage,
        backgroundBar = LightColorPalette.backgroundBar,
        borderBar = LightColorPalette.borderBar,
        iconMain = LightColorPalette.iconMain,
        textSort = LightColorPalette.textSort,
        textSearch = LightColorPalette.textSearch,
        delete = LightColorPalette.delete,
        archiveStart = LightColorPalette.archiveStart,
        archiveEnd = LightColorPalette.archiveEnd;

  AppModeScheme.dark()
      : backgroundPage = DarkColorPalette.backgroundPage,
        backgroundBar = DarkColorPalette.backgroundBar,
        borderBar = DarkColorPalette.borderBar,
        iconMain = DarkColorPalette.iconMain,
        textSort = DarkColorPalette.textSort,
        textSearch = DarkColorPalette.textSearch,
        delete = DarkColorPalette.delete,
        archiveStart = DarkColorPalette.archiveStart,
        archiveEnd = DarkColorPalette.archiveEnd;

  const AppModeScheme._({
    required this.backgroundPage,
    required this.backgroundBar,
    required this.borderBar,
    required this.iconMain,
    required this.textSort,
    required this.textSearch,
    required this.delete,
    required this.archiveStart,
    required this.archiveEnd,
  });

  @override
  ThemeExtension<AppModeScheme> copyWith({
    Color? backgroundPage,
    Color? backgroundBar,
    Color? borderBar,
    Color? iconMain,
    Color? textSort,
    Color? textSearch,
    Color? delete,
    Color? archiveStart,
    Color? archiveEnd,
  }) {
    return AppModeScheme._(
      backgroundPage: backgroundPage ?? this.backgroundPage,
      backgroundBar: backgroundBar ?? this.backgroundBar,
      borderBar: borderBar ?? this.borderBar,
      iconMain: iconMain ?? this.iconMain,
      textSort: textSort ?? this.textSort,
      textSearch: textSearch ?? this.textSearch,
      delete: delete ?? this.delete,
      archiveStart: archiveStart ?? this.archiveStart,
      archiveEnd: archiveEnd ?? this.archiveEnd,
    );
  }

  @override
  ThemeExtension<AppModeScheme> lerp(
    covariant ThemeExtension<AppModeScheme>? other,
    double t,
  ) {
    if (other is! AppModeScheme) {
      return this;
    }
    return AppModeScheme._(
      backgroundPage: Color.lerp(backgroundPage, other.backgroundPage, t)!,
      backgroundBar: Color.lerp(backgroundBar, other.backgroundBar, t)!,
      borderBar: Color.lerp(borderBar, other.borderBar, t)!,
      iconMain: Color.lerp(iconMain, other.iconMain, t)!,
      textSort: Color.lerp(textSort, other.textSort, t)!,
      textSearch: Color.lerp(textSearch, other.textSearch, t)!,
      delete: Color.lerp(delete, other.delete, t)!,
      archiveStart: Color.lerp(archiveStart, other.archiveStart, t)!,
      archiveEnd: Color.lerp(archiveEnd, other.archiveEnd, t)!,
    );
  }
}
