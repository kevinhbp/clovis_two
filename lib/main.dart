import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'global/service/base/network_service.dart';
import 'global/strings/strings.dart';
import 'global/themes/app_theme.dart';
import 'global/utils/hive_config.dart';
import 'modules/main/main_page.dart';
import 'modules/main/main_page_binding.dart';
import 'modules/pokemon/pokemon_page.dart';
import 'modules/pokemon/pokemon_page_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitDown
  ]).then((_) {
    runZonedGuarded(() async {
      await _initializeApp();

      runApp(const MyApp());
    }, (error, stack) async {
      if (!kIsWeb) {
        exit(1);
      } else if (kDebugMode) {
        print(stack);
      }
    });
  });
}

Future<void> _initializeApp() async {
  // Initiate Hive
  await HiveConfig.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentMode, child) => GetMaterialApp(
          title: Strings.appName,
          navigatorKey: alice.getNavigatorKey(),
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: currentMode,
          debugShowCheckedModeBanner: false,
          getPages: Routes.routes,
          initialRoute: Routes.mainPage,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown
            },
          ),
        ),
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
