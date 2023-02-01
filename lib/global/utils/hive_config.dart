import 'package:hive_flutter/hive_flutter.dart';

import '../data/entity/ability.dart';
import '../data/entity/poke_type.dart';
import '../data/entity/pokemon.dart';
import '../data/entity/result.dart';
import '../data/entity/stat.dart';

mixin HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapter();
    await _unBoxing();
  }

  static void _registerAdapter() {
    Hive
        ..registerAdapter(ResultAdapter())
        ..registerAdapter(AbilityAdapter())
        ..registerAdapter(StatAdapter())
        ..registerAdapter(PokeTypeAdapter())
        ..registerAdapter(PokemonAdapter());
  }

  static Future<void> _unBoxing() async {
    await Hive.openBox<Pokemon>(HiveBoxList.pokemonBox);
    await Hive.openBox(HiveBoxList.session);
  }
}

mixin HiveBoxList {
  static const String pokemonBox = 'pokemon-box';
  static const String session = 'session';
}
