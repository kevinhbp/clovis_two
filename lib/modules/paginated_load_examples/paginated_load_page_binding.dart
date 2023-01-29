import 'package:get/get.dart';

import 'paginated_load_page_controller.dart';

class PaginatedLoadPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaginatedLoadPageController>(PaginatedLoadPageController.new,
        fenix: true);
  }
}
