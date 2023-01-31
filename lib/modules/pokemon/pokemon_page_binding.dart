import 'package:get/get.dart';

import 'pokemon_page_controller.dart';

class PokemonPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<PokemonPageController>(PokemonPageController.new, fenix: true);
  }
}