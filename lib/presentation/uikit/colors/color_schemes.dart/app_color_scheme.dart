import 'package:flutter/material.dart';
import 'package:my_customs_v2/presentation/uikit/colors/color_palette.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color lightMainColor;
  final Color mainColor;
  final Color buttonBack;
  final Color textForm;
  final Color buttonFront;

  AppColorScheme.purple()
      : lightMainColor = PurpleColorPalette.lightMainColor,
        mainColor = PurpleColorPalette.mainColor,
        buttonBack = PurpleColorPalette.buttonBack,
        textForm = PurpleColorPalette.textForm,
        buttonFront = PurpleColorPalette.buttonFront;

  AppColorScheme.blue()
      : lightMainColor = BlueColorPalette.lightMainColor,
        mainColor = BlueColorPalette.mainColor,
        buttonBack = BlueColorPalette.buttonBack,
        textForm = BlueColorPalette.textForm,
        buttonFront = BlueColorPalette.buttonFront;

  const AppColorScheme._({
    required this.lightMainColor,
    required this.mainColor,
    required this.buttonBack,
    required this.textForm,
    required this.buttonFront,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? lightMainColor,
    Color? mainColor,
    Color? buttonBack,
    Color? textForm,
    Color? buttonFront,
  }) {
    return AppColorScheme._(
      lightMainColor: lightMainColor ?? this.lightMainColor,
      mainColor: mainColor ?? this.mainColor,
      buttonBack: buttonBack ?? this.buttonBack,
      textForm: textForm ?? this.textForm,
      buttonFront: buttonFront ?? this.buttonFront,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    covariant ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }
    return AppColorScheme._(
      lightMainColor: Color.lerp(lightMainColor, other.lightMainColor, t)!,
      mainColor: Color.lerp(mainColor, other.mainColor, t)!,
      buttonBack: Color.lerp(buttonBack, other.buttonBack, t)!,
      textForm: Color.lerp(textForm, other.textForm, t)!,
      buttonFront: Color.lerp(buttonFront, other.buttonFront, t)!,
    );
  }
}
