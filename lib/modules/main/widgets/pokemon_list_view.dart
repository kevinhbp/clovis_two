import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../global/data/entity/pokemon.dart';
import '../../../global/widgets/loading_view.dart';
import '../controllers/pokemon_list_controller.dart';
import 'main_page_header.dart';
import 'pokemon_item_view.dart';

class PokemonListView extends StatelessWidget {
  PokemonListView({Key? key}) : super(key: key);

  final PokemonListController controller = Get.find();

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () => Future.sync(() {}),
        child: CustomScrollView(
          slivers: [
            MainPageHeader(),
            PagedSliverList<int, Pokemon>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                firstPageProgressIndicatorBuilder: (context) =>
                    const LoadingView(),
                newPageProgressIndicatorBuilder: (context) =>
                    const LoadingView(height: 80,),
                itemBuilder: (context, item, index) =>
                    PokemonItemView(item: item),
              ),
            )
          ],
        ),
      );
}
