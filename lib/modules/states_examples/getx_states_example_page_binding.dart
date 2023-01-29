import 'package:get/get.dart';

import 'getx_states_example_page_controller.dart';

class GetxStatesExamplePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetxStatesExamplePageController>(
      GetxStatesExamplePageController.new,
      fenix: true,
    );
  }
}
