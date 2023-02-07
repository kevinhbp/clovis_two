import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/data/entity/pokemon.dart';
import '../pokemon/controllers/pokemon_detail_controller.dart';
import '../pokemon/widgets/pokemon_detail_view.dart';
import 'main_page_controller.dart';
import 'widgets/pokemon_list_view.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final PokemonDetailController ctrlDetail = Get.find();

  @override
  Widget build(BuildContext context) => GetBuilder<MainPageController>(
        builder: (controller) => Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: AdaptiveLayout(
              smallLayout: PokemonListView(),
              mediumLayout: Row(
                children: [
                  Expanded(child: PokemonListView()),
                  Expanded(
                    child: Obx(
                      () => PokemonDetailView(
                        item: ctrlDetail.pokemon.value,
                        onTapClose: () {
                          ctrlDetail.pokemon.value = Pokemon.empty();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
