import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pokemon/widgets/pokemon_detail_view.dart';
import 'main_page_controller.dart';
import 'widgets/pokemon_list_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
              Expanded(child: PokemonDetailView())
            ],
          ),
        ),
      ),
    ),
  );
}
