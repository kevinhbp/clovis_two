import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../global/data/entity/pokemon.dart';
import '../../pokemon/controllers/pokemon_detail_controller.dart';
import '../controllers/pokemon_list_controller.dart';
import 'pokemon_item_view.dart';

class PokemonListView extends StatelessWidget {
  PokemonListView({Key? key}) : super(key: key);

  final PokemonListController listCtrl = Get.find();
  final PokemonDetailController detailCtrl = Get.find();

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () => Future.sync(() {}),
        child: CustomScrollView(
          slivers: [
            PagedSliverList<int, Pokemon>(
              pagingController: listCtrl.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                itemBuilder: (context, item, index) =>
                    PokemonItemView(item: item),
              ),
            )
          ],
        ),
      );
}
