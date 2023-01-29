import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global/strings/strings.dart';
import 'global/themes/app_theme.dart';
import 'modules/grid_view_examples/grid_view_example.dart';
import 'modules/landing/landing_page.dart';
import 'modules/landing/landing_page_binding.dart';
import 'modules/list_view_examples/list_view_example.dart';
import 'modules/paginated_load_examples/paginated_load_page.dart';
import 'modules/paginated_load_examples/paginated_load_page_binding.dart';

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
        initialRoute: Routes.landingPage,
      );
}

mixin Routes {
  static const String landingPage = '/';
  static const String listViewPage = '/list-view';
  static const String gridViewPage = '/grid-view';
  static const String pagedListViewPage = '/paged-list-view';

  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: landingPage,
      page: LandingPage.new,
      binding: LandingPageBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: listViewPage,
      page: ListViewExample.new,
      transition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: gridViewPage,
      page: GridViewExample.new,
      transition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: pagedListViewPage,
      page: PaginatedLoadPage.new,
      binding: PaginatedLoadPageBinding(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
