import 'package:get/get.dart';

import 'main_page_controller.dart';

class MainPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(MainPageController.new, fenix: true);
  }
}