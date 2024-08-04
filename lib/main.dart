import 'package:flutter/material.dart';
import 'package:my_customs_v2/data/repository/theme_repository.dart';
import 'package:my_customs_v2/data/storage/theme/theme_storage.dart';
import 'package:my_customs_v2/presentation/components/main_bar.dart';
import 'package:my_customs_v2/data/storage/database/db.dart';
import 'package:my_customs_v2/presentation/providers/image_path_provider.dart';
import 'package:my_customs_v2/presentation/providers/purchase_provider.dart';
import 'package:my_customs_v2/presentation/providers/sort_order_provider.dart';
import 'package:my_customs_v2/presentation/providers/theme_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DB.initialize();

  final appDir = await getApplicationDocumentsDirectory();

  final prefs = await SharedPreferences.getInstance();

  final themeStorage = ThemeStorage(prefs: prefs);

  final themeRepository = ThemeRepository(themeStorage: themeStorage);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DB()),
        ChangeNotifierProvider(
          create: (context) => ImagePathProvider(
            appDirPath: appDir.path,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(
            themeRepository: themeRepository,
          ),
        ),
        ChangeNotifierProvider(create: (context) => SortOrderProvider()),
        ChangeNotifierProvider(create: (context) => PurchaseProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeController>().themeData,
      home: const MainBar(),
    );
  }
}
