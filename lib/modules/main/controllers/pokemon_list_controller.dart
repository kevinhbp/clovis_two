import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../global/data/entity/pokemon.dart';

class PokemonListController extends GetxController {
  static const loadLimit = 5;
  final pagingController = PagingController<int, Pokemon>(
    firstPageKey: 1,
    invisibleItemsThreshold: loadLimit * 3,
  );
}
