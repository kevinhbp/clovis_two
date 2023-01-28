import 'package:get/get.dart';

import 'landing_page_controller.dart';

class LandingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingPageController>(LandingPageController.new, fenix: true);
  }
}
