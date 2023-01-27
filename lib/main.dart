import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global/strings/strings.dart';
import 'global/themes/app_theme.dart';
import 'modules/grid_view_examples/grid_view_example.dart';
import 'modules/list_view_examples/list_view_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
      title: Strings.appName,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const GridViewExample(),
    );
}
