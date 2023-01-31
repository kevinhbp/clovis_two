import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global/strings/strings.dart';
import 'global/themes/app_theme.dart';
import 'modules/main/main_page.dart';
import 'modules/main/main_page_binding.dart';
import 'modules/pokemon/pokemon_page.dart';
import 'modules/pokemon/pokemon_page_binding.dart';

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
  static const String pokemonPage = '/pokemon';

  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: mainPage,
      page: MainPage.new,
      binding: MainPageBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: pokemonPage,
      page: PokemonPage.new,
      binding: PokemonPageBinding(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
