import 'package:get/get.dart';

import '../pokemon/controllers/pokemon_detail_controller.dart';
import 'controllers/pokemon_list_controller.dart';
import 'main_page_controller.dart';

class MainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<MainPageController>(
        MainPageController.new,
        fenix: true,
      )
      ..lazyPut<PokemonListController>(
        PokemonListController.new,
        fenix: true,
      )
      ..lazyPut<PokemonDetailController>(
        PokemonDetailController.new,
        fenix: true,
      );
  }
}
