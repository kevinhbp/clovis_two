import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:hive/hive.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../global/bin/data/input_type.dart';
import '../../../global/bin/widgets/input/edit_text.dart';
import '../../../global/data/entity/pokemon.dart';
import '../../../global/service/base/network_service.dart';
import '../../../global/service/pokemon/poke_client.dart';
import '../../../global/utils/hive_config.dart';

class PokemonListController extends GetxController {
  static const loadLimit = 5;
  final pokeClient = PokeClient(NetworkService().getDioClient());
  final pokeBox = Hive.box<Pokemon>(HiveBoxList.pokemonBox);
  final pagingController = PagingController<int, Pokemon>(
    firstPageKey: 1,
    invisibleItemsThreshold: loadLimit * 3,
  );
  final searchController = EditTextController(AppInputType.textInputType);
  final dbc = Debouncer(delay: const Duration(milliseconds: 300));
  String keyword = '';

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
     if (keyword.isEmpty) {
       _fetchPage(pageKey);
     } else {
       _searchPokemonFromDatabase();
     }
    });
    searchController.onChanged = (text) {
      keyword = text ?? '';
      dbc.call(pagingController.refresh);
    };
  }

  @override
  void onClose() {
    pagingController.dispose();
    searchController.dispose();
    super.onClose();
  }

  // region FETCH DATA
  Future<void> _fetchPage(int page) async {
    try {
      // get the pokemon locally.
      final local = _loadLocalPokemon(page);
      if (local.isNotEmpty && local.length >= loadLimit) {
        final nextPageKey = page + 1;
        pagingController.appendPage(local, nextPageKey);
        return;
      }

      final offset = (page * loadLimit) - loadLimit;
      final response = await pokeClient.getPokemonList(
        offset: offset,
        limit: loadLimit,
      );
      final newItems = <Pokemon>[];
      for (final it in response.results) {
        final pokemonDetail = await pokeClient.getPokemonDetail(it.name);
        newItems.add(pokemonDetail);
        _savePokemon(pokemonDetail);
      }
      final isLastPage = newItems.length < loadLimit;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } on Exception catch (e) {
      e.printError();
      pagingController.error = e;
    }
  }

  void _searchPokemonFromDatabase() {
    final searchResult = pokeBox.values.where((pokemon) {
      final hasMatchId = pokemon.id.toString() == keyword;
      final hasContainsName = pokemon.name.contains(keyword);
      return hasMatchId || hasContainsName;
    });
    pagingController.appendLastPage(searchResult.toList());
  }

  List<Pokemon> _loadLocalPokemon(int page) {
    final end = page * loadLimit;
    final start = end - loadLimit;
    final list = pokeBox.values.toList();
    if (list.length < end) return [];
    return list.getRange(start, end).toList();
  }

  void _savePokemon(Pokemon pokemon) {
    if (pokeBox.length > 0) {
      final mPoke = pokeBox.get(pokemon.id);
      if (mPoke != null) {
        if (kDebugMode) {
          print('Pokemon is not saved. Pokemon with id ${pokemon.id} is '
              'already saved.');
        }
        return;
      }
    }
    pokeBox.put(pokemon.id, pokemon);
  }
// endregion
}
