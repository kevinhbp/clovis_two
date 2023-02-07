import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/data/entity/pokemon.dart';
import 'controllers/pokemon_detail_controller.dart';
import 'pokemon_page_controller.dart';
import 'widgets/pokemon_detail_view.dart';

class PokemonPage extends StatelessWidget {
  PokemonPage({Key? key}) : super(key: key);

  final PokemonDetailController ctrlDetail = Get.find();

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    if (args is Pokemon) {
      ctrlDetail.pokemon.value = args;
    }
    return GetBuilder<PokemonPageController>(
      builder: (controller) => Scaffold(
        body: Obx(
          () => PokemonDetailView(
            item: ctrlDetail.pokemon.value,
          ),
        ),
      ),
    );
  }
}
