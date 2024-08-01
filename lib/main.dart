import 'package:flutter/material.dart';
import 'package:my_customs_v2/components/main_bar.dart';
import 'package:my_customs_v2/database/db.dart';
import 'package:my_customs_v2/providers/image_path_provider.dart';
import 'package:my_customs_v2/providers/purchase_provider.dart';
import 'package:my_customs_v2/providers/sort_order_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DB.initialize();

  final appDir = await getApplicationDocumentsDirectory();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DB()),
        ChangeNotifierProvider(
          create: (context) => ImagePathProvider(
            appDirPath: appDir.path,
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainBar(),
    );
  }
}
