import 'package:flutter/material.dart';
import 'package:my_customs_v2/presentation/uikit/colors/color_schemes.dart/app_color_scheme.dart';
import 'package:my_customs_v2/presentation/uikit/colors/color_schemes.dart/app_mode_scheme.dart';

class AppThemeData {
  static final purpleLightTheme = ThemeData(
    extensions: [_lightColorScheme, _purpleColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _purpleColorScheme.lightMainColor,
      onPrimary: _purpleColorScheme.mainColor,
      secondary: _purpleColorScheme.textForm,
      onSecondary: _purpleColorScheme.buttonBack,
      error: _lightColorScheme.archiveStart,
      onError: _lightColorScheme.archiveEnd,
      surface: _lightColorScheme.backgroundPage,
      onSurface: _lightColorScheme.backgroundBar,
      secondaryFixed: _purpleColorScheme.buttonFront,
      tertiary: _lightColorScheme.textSearch,
      onTertiary: _lightColorScheme.iconMain,
      tertiaryContainer: _lightColorScheme.textSort,
      onTertiaryContainer: _lightColorScheme.borderBar,
      errorContainer: _lightColorScheme.delete,
    ),
    iconTheme: IconThemeData(
      color: _lightColorScheme.iconMain,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: _lightColorScheme.textSort,
      ),
      bodyMedium: TextStyle(
        color: _lightColorScheme.textSort,
      ),
      bodyLarge: TextStyle(
        color: _lightColorScheme.textSort,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.backgroundBar,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: _lightColorScheme.iconMain,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _purpleColorScheme.buttonFront,
      backgroundColor: _purpleColorScheme.buttonBack,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _lightColorScheme.backgroundPage,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: _lightColorScheme.backgroundPage,
      dayForegroundColor: WidgetStateProperty.all(_lightColorScheme.borderBar),
      todayForegroundColor: WidgetStateProperty.all(_lightColorScheme.textSort),
      weekdayStyle: TextStyle(
        color: _lightColorScheme.borderBar,
      ),
      headerForegroundColor: _lightColorScheme.borderBar,
      dividerColor: _lightColorScheme.borderBar,
      yearForegroundColor: WidgetStateProperty.all(_lightColorScheme.borderBar),
      surfaceTintColor: _lightColorScheme.borderBar,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: _lightColorScheme.borderBar,
        ),
        hintStyle: TextStyle(
          color: _lightColorScheme.borderBar,
        ),
      ),
    ),
  );

  static final purpleDarkTheme = ThemeData(
    extensions: [_darkColorScheme, _purpleColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _purpleColorScheme.lightMainColor,
      onPrimary: _purpleColorScheme.mainColor,
      secondary: _purpleColorScheme.textForm,
      onSecondary: _purpleColorScheme.buttonBack,
      error: _darkColorScheme.archiveStart,
      onError: _darkColorScheme.archiveEnd,
      surface: _darkColorScheme.backgroundPage,
      onSurface: _darkColorScheme.backgroundBar,
      secondaryFixed: _purpleColorScheme.buttonFront,
      tertiary: _darkColorScheme.textSearch,
      onTertiary: _darkColorScheme.iconMain,
      tertiaryContainer: _darkColorScheme.textSort,
      onTertiaryContainer: _darkColorScheme.borderBar,
      errorContainer: _darkColorScheme.delete,
    ),
    iconTheme: IconThemeData(
      color: _darkColorScheme.iconMain,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: _darkColorScheme.textSort,
      ),
      bodyMedium: TextStyle(
        color: _darkColorScheme.textSort,
      ),
      bodyLarge: TextStyle(
        color: _darkColorScheme.textSort,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.backgroundBar,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: _darkColorScheme.iconMain,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _purpleColorScheme.buttonFront,
      backgroundColor: _purpleColorScheme.buttonBack,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _darkColorScheme.backgroundPage,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: _darkColorScheme.backgroundPage,
      dayForegroundColor: WidgetStateProperty.all(_darkColorScheme.borderBar),
      todayForegroundColor: WidgetStateProperty.all(_darkColorScheme.textSort),
      weekdayStyle: TextStyle(
        color: _darkColorScheme.borderBar,
      ),
      headerForegroundColor: _darkColorScheme.borderBar,
      dividerColor: _darkColorScheme.borderBar,
      yearForegroundColor: WidgetStateProperty.all(_darkColorScheme.borderBar),
      surfaceTintColor: _darkColorScheme.borderBar,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: _darkColorScheme.borderBar,
        ),
        hintStyle: TextStyle(
          color: _darkColorScheme.borderBar,
        ),
      ),
    ),
  );

  static final blueLightTheme = ThemeData(
    extensions: [_lightColorScheme, _blueColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _blueColorScheme.lightMainColor,
      onPrimary: _blueColorScheme.mainColor,
      secondary: _blueColorScheme.textForm,
      onSecondary: _blueColorScheme.buttonBack,
      error: _lightColorScheme.archiveStart,
      onError: _lightColorScheme.archiveEnd,
      surface: _lightColorScheme.backgroundPage,
      onSurface: _lightColorScheme.backgroundBar,
      secondaryFixed: _blueColorScheme.buttonFront,
      tertiary: _lightColorScheme.textSearch,
      onTertiary: _lightColorScheme.iconMain,
      tertiaryContainer: _lightColorScheme.textSort,
      onTertiaryContainer: _lightColorScheme.borderBar,
      errorContainer: _lightColorScheme.delete,
    ),
    iconTheme: IconThemeData(
      color: _lightColorScheme.iconMain,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: _lightColorScheme.textSort,
      ),
      bodyMedium: TextStyle(
        color: _lightColorScheme.textSort,
      ),
      bodyLarge: TextStyle(
        color: _lightColorScheme.textSort,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.backgroundBar,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: _lightColorScheme.iconMain,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _blueColorScheme.buttonFront,
      backgroundColor: _blueColorScheme.buttonBack,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _lightColorScheme.backgroundPage,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: _lightColorScheme.backgroundPage,
      dayForegroundColor: WidgetStateProperty.all(_lightColorScheme.borderBar),
      todayForegroundColor: WidgetStateProperty.all(_lightColorScheme.textSort),
      weekdayStyle: TextStyle(
        color: _lightColorScheme.borderBar,
      ),
      headerForegroundColor: _lightColorScheme.borderBar,
      dividerColor: _lightColorScheme.borderBar,
      yearForegroundColor: WidgetStateProperty.all(_lightColorScheme.borderBar),
      surfaceTintColor: _lightColorScheme.borderBar,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: _lightColorScheme.borderBar,
        ),
        hintStyle: TextStyle(
          color: _lightColorScheme.borderBar,
        ),
      ),
    ),
  );

  static final blueDarkTheme = ThemeData(
    extensions: [_darkColorScheme, _blueColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _blueColorScheme.lightMainColor,
      onPrimary: _blueColorScheme.mainColor,
      secondary: _blueColorScheme.textForm,
      onSecondary: _blueColorScheme.buttonBack,
      error: _darkColorScheme.archiveStart,
      onError: _darkColorScheme.archiveEnd,
      surface: _darkColorScheme.backgroundPage,
      onSurface: _darkColorScheme.backgroundBar,
      secondaryFixed: _blueColorScheme.buttonFront,
      tertiary: _darkColorScheme.textSearch,
      onTertiary: _darkColorScheme.iconMain,
      tertiaryContainer: _darkColorScheme.textSort,
      onTertiaryContainer: _darkColorScheme.borderBar,
      errorContainer: _darkColorScheme.delete,
    ),
    iconTheme: IconThemeData(
      color: _darkColorScheme.iconMain,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: _darkColorScheme.textSort,
      ),
      bodyMedium: TextStyle(
        color: _darkColorScheme.textSort,
      ),
      bodyLarge: TextStyle(
        color: _darkColorScheme.textSort,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.backgroundBar,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: _darkColorScheme.iconMain,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _blueColorScheme.buttonFront,
      backgroundColor: _blueColorScheme.buttonBack,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _darkColorScheme.backgroundPage,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: _darkColorScheme.backgroundPage,
      dayForegroundColor: WidgetStateProperty.all(_darkColorScheme.borderBar),
      todayForegroundColor: WidgetStateProperty.all(_darkColorScheme.textSort),
      weekdayStyle: TextStyle(
        color: _darkColorScheme.borderBar,
      ),
      headerForegroundColor: _darkColorScheme.borderBar,
      dividerColor: _darkColorScheme.borderBar,
      yearForegroundColor: WidgetStateProperty.all(_darkColorScheme.borderBar),
      surfaceTintColor: _darkColorScheme.borderBar,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: _darkColorScheme.borderBar,
        ),
        hintStyle: TextStyle(
          color: _darkColorScheme.borderBar,
        ),
      ),
    ),
  );

  static final greenLightTheme = ThemeData(
    extensions: [_lightColorScheme, _greenColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _greenColorScheme.lightMainColor,
      onPrimary: _greenColorScheme.mainColor,
      secondary: _greenColorScheme.textForm,
      onSecondary: _greenColorScheme.buttonBack,
      error: _lightColorScheme.archiveStart,
      onError: _lightColorScheme.archiveEnd,
      surface: _lightColorScheme.backgroundPage,
      onSurface: _lightColorScheme.backgroundBar,
      secondaryFixed: _greenColorScheme.buttonFront,
      tertiary: _lightColorScheme.textSearch,
      onTertiary: _lightColorScheme.iconMain,
      tertiaryContainer: _lightColorScheme.textSort,
      onTertiaryContainer: _lightColorScheme.borderBar,
      errorContainer: _lightColorScheme.delete,
    ),
    iconTheme: IconThemeData(
      color: _lightColorScheme.iconMain,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: _lightColorScheme.textSort,
      ),
      bodyMedium: TextStyle(
        color: _lightColorScheme.textSort,
      ),
      bodyLarge: TextStyle(
        color: _lightColorScheme.textSort,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.backgroundBar,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: _lightColorScheme.iconMain,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _greenColorScheme.buttonFront,
      backgroundColor: _greenColorScheme.buttonBack,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _lightColorScheme.backgroundPage,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: _lightColorScheme.backgroundPage,
      dayForegroundColor: WidgetStateProperty.all(_lightColorScheme.borderBar),
      todayForegroundColor: WidgetStateProperty.all(_lightColorScheme.textSort),
      weekdayStyle: TextStyle(
        color: _lightColorScheme.borderBar,
      ),
      headerForegroundColor: _lightColorScheme.borderBar,
      dividerColor: _lightColorScheme.borderBar,
      yearForegroundColor: WidgetStateProperty.all(_lightColorScheme.borderBar),
      surfaceTintColor: _lightColorScheme.borderBar,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: _lightColorScheme.borderBar,
        ),
        hintStyle: TextStyle(
          color: _lightColorScheme.borderBar,
        ),
      ),
    ),
  );

  static final greenDarkTheme = ThemeData(
    extensions: [_darkColorScheme, _greenColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _greenColorScheme.lightMainColor,
      onPrimary: _greenColorScheme.mainColor,
      secondary: _greenColorScheme.textForm,
      onSecondary: _greenColorScheme.buttonBack,
      error: _darkColorScheme.archiveStart,
      onError: _darkColorScheme.archiveEnd,
      surface: _darkColorScheme.backgroundPage,
      onSurface: _darkColorScheme.backgroundBar,
      secondaryFixed: _greenColorScheme.buttonFront,
      tertiary: _darkColorScheme.textSearch,
      onTertiary: _darkColorScheme.iconMain,
      tertiaryContainer: _darkColorScheme.textSort,
      onTertiaryContainer: _darkColorScheme.borderBar,
      errorContainer: _darkColorScheme.delete,
    ),
    iconTheme: IconThemeData(
      color: _darkColorScheme.iconMain,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: _darkColorScheme.textSort,
      ),
      bodyMedium: TextStyle(
        color: _darkColorScheme.textSort,
      ),
      bodyLarge: TextStyle(
        color: _darkColorScheme.textSort,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.backgroundBar,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: _darkColorScheme.iconMain,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _greenColorScheme.buttonFront,
      backgroundColor: _greenColorScheme.buttonBack,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _darkColorScheme.backgroundPage,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: _darkColorScheme.backgroundPage,
      dayForegroundColor: WidgetStateProperty.all(_darkColorScheme.borderBar),
      todayForegroundColor: WidgetStateProperty.all(_darkColorScheme.textSort),
      weekdayStyle: TextStyle(
        color: _darkColorScheme.borderBar,
      ),
      headerForegroundColor: _darkColorScheme.borderBar,
      dividerColor: _darkColorScheme.borderBar,
      yearForegroundColor: WidgetStateProperty.all(_darkColorScheme.borderBar),
      surfaceTintColor: _darkColorScheme.borderBar,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: _darkColorScheme.borderBar,
        ),
        hintStyle: TextStyle(
          color: _darkColorScheme.borderBar,
        ),
      ),
    ),
  );

  static final orangeLightTheme = ThemeData(
    extensions: [_lightColorScheme, _orangeColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _orangeColorScheme.lightMainColor,
      onPrimary: _orangeColorScheme.mainColor,
      secondary: _orangeColorScheme.textForm,
      onSecondary: _orangeColorScheme.buttonBack,
      error: _lightColorScheme.archiveStart,
      onError: _lightColorScheme.archiveEnd,
      surface: _lightColorScheme.backgroundPage,
      onSurface: _lightColorScheme.backgroundBar,
      secondaryFixed: _orangeColorScheme.buttonFront,
      tertiary: _lightColorScheme.textSearch,
      onTertiary: _lightColorScheme.iconMain,
      tertiaryContainer: _lightColorScheme.textSort,
      onTertiaryContainer: _lightColorScheme.borderBar,
      errorContainer: _lightColorScheme.delete,
    ),
    iconTheme: IconThemeData(
      color: _lightColorScheme.iconMain,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: _lightColorScheme.textSort,
      ),
      bodyMedium: TextStyle(
        color: _lightColorScheme.textSort,
      ),
      bodyLarge: TextStyle(
        color: _lightColorScheme.textSort,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.backgroundBar,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: _lightColorScheme.iconMain,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _orangeColorScheme.buttonFront,
      backgroundColor: _orangeColorScheme.buttonBack,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _lightColorScheme.backgroundPage,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: _lightColorScheme.backgroundPage,
      dayForegroundColor: WidgetStateProperty.all(_lightColorScheme.borderBar),
      todayForegroundColor: WidgetStateProperty.all(_lightColorScheme.textSort),
      weekdayStyle: TextStyle(
        color: _lightColorScheme.borderBar,
      ),
      headerForegroundColor: _lightColorScheme.borderBar,
      dividerColor: _lightColorScheme.borderBar,
      yearForegroundColor: WidgetStateProperty.all(_lightColorScheme.borderBar),
      surfaceTintColor: _lightColorScheme.borderBar,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: _lightColorScheme.borderBar,
        ),
        hintStyle: TextStyle(
          color: _lightColorScheme.borderBar,
        ),
      ),
    ),
  );

  static final orangeDarkTheme = ThemeData(
    extensions: [_darkColorScheme, _orangeColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _orangeColorScheme.lightMainColor,
      onPrimary: _orangeColorScheme.mainColor,
      secondary: _orangeColorScheme.textForm,
      onSecondary: _orangeColorScheme.buttonBack,
      error: _darkColorScheme.archiveStart,
      onError: _darkColorScheme.archiveEnd,
      surface: _darkColorScheme.backgroundPage,
      onSurface: _darkColorScheme.backgroundBar,
      secondaryFixed: _orangeColorScheme.buttonFront,
      tertiary: _darkColorScheme.textSearch,
      onTertiary: _darkColorScheme.iconMain,
      tertiaryContainer: _darkColorScheme.textSort,
      onTertiaryContainer: _darkColorScheme.borderBar,
      errorContainer: _darkColorScheme.delete,
    ),
    iconTheme: IconThemeData(
      color: _darkColorScheme.iconMain,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: _darkColorScheme.textSort,
      ),
      bodyMedium: TextStyle(
        color: _darkColorScheme.textSort,
      ),
      bodyLarge: TextStyle(
        color: _darkColorScheme.textSort,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.backgroundBar,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: _darkColorScheme.iconMain,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _orangeColorScheme.buttonFront,
      backgroundColor: _orangeColorScheme.buttonBack,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _darkColorScheme.backgroundPage,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: _darkColorScheme.backgroundPage,
      dayForegroundColor: WidgetStateProperty.all(_darkColorScheme.borderBar),
      todayForegroundColor: WidgetStateProperty.all(_darkColorScheme.textSort),
      weekdayStyle: TextStyle(
        color: _darkColorScheme.borderBar,
      ),
      headerForegroundColor: _darkColorScheme.borderBar,
      dividerColor: _darkColorScheme.borderBar,
      yearForegroundColor: WidgetStateProperty.all(_darkColorScheme.borderBar),
      surfaceTintColor: _darkColorScheme.borderBar,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: _darkColorScheme.borderBar,
        ),
        hintStyle: TextStyle(
          color: _darkColorScheme.borderBar,
        ),
      ),
    ),
  );
  static final redSkyLightTheme = ThemeData(
    extensions: [_lightColorScheme, _redSkyColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _redSkyColorScheme.lightMainColor,
      onPrimary: _redSkyColorScheme.mainColor,
      secondary: _redSkyColorScheme.textForm,
      onSecondary: _redSkyColorScheme.buttonBack,
      error: _lightColorScheme.archiveStart,
      onError: _lightColorScheme.archiveEnd,
      surface: _lightColorScheme.backgroundPage,
      onSurface: _lightColorScheme.backgroundBar,
      secondaryFixed: _redSkyColorScheme.buttonFront,
      tertiary: _lightColorScheme.textSearch,
      onTertiary: _lightColorScheme.iconMain,
      tertiaryContainer: _lightColorScheme.textSort,
      onTertiaryContainer: _lightColorScheme.borderBar,
      errorContainer: _lightColorScheme.delete,
    ),
    iconTheme: IconThemeData(
      color: _lightColorScheme.iconMain,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: _lightColorScheme.textSort,
      ),
      bodyMedium: TextStyle(
        color: _lightColorScheme.textSort,
      ),
      bodyLarge: TextStyle(
        color: _lightColorScheme.textSort,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.backgroundBar,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: _lightColorScheme.iconMain,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _redSkyColorScheme.buttonFront,
      backgroundColor: _redSkyColorScheme.buttonBack,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _lightColorScheme.backgroundPage,
      titleTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: _lightColorScheme.textSort,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: _lightColorScheme.backgroundPage,
      dayForegroundColor: WidgetStateProperty.all(_lightColorScheme.borderBar),
      todayForegroundColor: WidgetStateProperty.all(_lightColorScheme.textSort),
      weekdayStyle: TextStyle(
        color: _lightColorScheme.borderBar,
      ),
      headerForegroundColor: _lightColorScheme.borderBar,
      dividerColor: _lightColorScheme.borderBar,
      yearForegroundColor: WidgetStateProperty.all(_lightColorScheme.borderBar),
      surfaceTintColor: _lightColorScheme.borderBar,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: _lightColorScheme.borderBar,
        ),
        hintStyle: TextStyle(
          color: _lightColorScheme.borderBar,
        ),
      ),
    ),
  );

  static final redSkyDarkTheme = ThemeData(
    extensions: [_darkColorScheme, _redSkyColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _redSkyColorScheme.lightMainColor,
      onPrimary: _redSkyColorScheme.mainColor,
      secondary: _redSkyColorScheme.textForm,
      onSecondary: _redSkyColorScheme.buttonBack,
      error: _darkColorScheme.archiveStart,
      onError: _darkColorScheme.archiveEnd,
      surface: _darkColorScheme.backgroundPage,
      onSurface: _darkColorScheme.backgroundBar,
      secondaryFixed: _redSkyColorScheme.buttonFront,
      tertiary: _darkColorScheme.textSearch,
      onTertiary: _darkColorScheme.iconMain,
      tertiaryContainer: _darkColorScheme.textSort,
      onTertiaryContainer: _darkColorScheme.borderBar,
      errorContainer: _darkColorScheme.delete,
    ),
    iconTheme: IconThemeData(
      color: _darkColorScheme.iconMain,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: _darkColorScheme.textSort,
      ),
      bodyMedium: TextStyle(
        color: _darkColorScheme.textSort,
      ),
      bodyLarge: TextStyle(
        color: _darkColorScheme.textSort,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.backgroundBar,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: _darkColorScheme.iconMain,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _redSkyColorScheme.buttonFront,
      backgroundColor: _redSkyColorScheme.buttonBack,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _darkColorScheme.backgroundPage,
      titleTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: _darkColorScheme.textSort,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: _darkColorScheme.backgroundPage,
      dayForegroundColor: WidgetStateProperty.all(_darkColorScheme.borderBar),
      todayForegroundColor: WidgetStateProperty.all(_darkColorScheme.textSort),
      weekdayStyle: TextStyle(
        color: _darkColorScheme.borderBar,
      ),
      headerForegroundColor: _darkColorScheme.borderBar,
      dividerColor: _darkColorScheme.borderBar,
      yearForegroundColor: WidgetStateProperty.all(_darkColorScheme.borderBar),
      surfaceTintColor: _darkColorScheme.borderBar,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: _darkColorScheme.borderBar,
        ),
        hintStyle: TextStyle(
          color: _darkColorScheme.borderBar,
        ),
      ),
    ),
  );

  static final _lightColorScheme = AppModeScheme.light();
  static final _darkColorScheme = AppModeScheme.dark();

  static final _purpleColorScheme = AppColorScheme.purple();
  static final _blueColorScheme = AppColorScheme.blue();
  static final _greenColorScheme = AppColorScheme.green();
  static final _orangeColorScheme = AppColorScheme.orange();
  static final _redSkyColorScheme = AppColorScheme.redSky();
}
