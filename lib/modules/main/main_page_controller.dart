import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class MainPageController extends GetxController {

  final themeSwitcherFlag = false.obs;

  @override
  void onInit() {
    super.onInit();
    themeSwitcherFlag.value = MyApp.themeNotifier.value == ThemeMode.light;
  }
}