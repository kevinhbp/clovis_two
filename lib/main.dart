import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global/strings/strings.dart';
import 'global/themes/app_theme.dart';

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
        getPages: Routes.routes,
        initialRoute: Routes.mainPage,
      );
}

mixin Routes {
  static const String mainPage = '/';
  static const String detailPage = '/list-view';

  static List<GetPage<dynamic>> routes = [];
}
