import 'package:flutter/material.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';

class ThemeColorButton extends StatelessWidget {
  final Color? color;
  final VoidCallback onPressed;
  final LinearGradient? gradient;

  const ThemeColorButton({
    super.key,
    this.color,
    required this.onPressed,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          gradient: gradient,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: context.colorScheme.onTertiaryContainer,
          ),
        ),
        width: 50,
        height: 50,
      ),
    );
  }
}
