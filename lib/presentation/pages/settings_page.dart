import 'package:flutter/material.dart';
import 'package:my_customs_v2/domain/enums/theme_color.dart';
import 'package:my_customs_v2/presentation/components/archived_purchase.dart';
import 'package:my_customs_v2/presentation/components/theme_color_button.dart';
import 'package:my_customs_v2/presentation/providers/theme_controller.dart';
import 'package:my_customs_v2/presentation/uikit/colors/color_palette.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                context.read<ThemeController>().toggleThemeMode();
              },
              child: Consumer<ThemeController>(
                builder: (context, provider, child) => Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: context.colorScheme.onTertiaryContainer),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        provider.isDarkMode
                            ? Icons.mode_night_outlined
                            : Icons.light_mode_outlined,
                        color: context.colorScheme.secondaryFixed,
                      ),
                      Text(
                        provider.isDarkMode ? 'Темная тема' : 'Светлая тема',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: context.colorScheme.secondaryFixed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ThemeColorButton(
                    color: PurpleColorPalette.lightMainColor,
                    onPressed: () => context
                        .read<ThemeController>()
                        .setThemeColor(ThemeColor.purple),
                  ),
                  ThemeColorButton(
                    color: BlueColorPalette.lightMainColor,
                    onPressed: () => context
                        .read<ThemeController>()
                        .setThemeColor(ThemeColor.blue),
                  ),
                  ThemeColorButton(
                    color: GreenColorPalette.lightMainColor,
                    onPressed: () => context
                        .read<ThemeController>()
                        .setThemeColor(ThemeColor.green),
                  ),
                  ThemeColorButton(
                    color: OrangeColorPalette.lightMainColor,
                    onPressed: () => context
                        .read<ThemeController>()
                        .setThemeColor(ThemeColor.orange),
                  ),
                  ThemeColorButton(
                    // color: RedSkyColorPalette.lightMainColor,
                    gradient: const LinearGradient(colors: [
                      RedSkyColorPalette.lightMainColor,
                      RedSkyColorPalette.mainColor,
                    ]),
                    onPressed: () => context
                        .read<ThemeController>()
                        .setThemeColor(ThemeColor.redSky),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ArchivedPurchase(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: context.colorScheme.onTertiaryContainer),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.archive_outlined,
                      color: context.colorScheme.secondaryFixed,
                    ),
                    Text(
                      'Архивные закупки',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: context.colorScheme.secondaryFixed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
