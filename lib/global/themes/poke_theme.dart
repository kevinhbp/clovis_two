import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

mixin PokemonColors {
  static const normal = Color(0xffa8a8a8);
  static const fire = Color(0xFFFF7847);
  static const fighting = Color(0xFFEB4971);
  static const water = Color(0xff66b9ff);
  static const flying = Color(0xFFA197E1);
  static const grass = Color(0xff3fd456);
  static const poison = Color(0xffca58ec);
  static const electric = Color(0xFFFFDB63);
  static const ground = Color(0xFFF78551);
  static const psychic = Color(0xFFfb9d9a);
  static const rock = Color(0xffccc1b0);
  static const ice = Color(0xFF91d9cd);
  static const bug = Color(0xFFD2EE4E);
  static const dragon = Color(0xFF6F37FA);
  static const ghost = Color(0xff9198c2);
  static const dark = Color(0xff535356);
  static const steel = Color(0xFF78aab5);
  static const fairy = Color(0xFFf1a6eb);

  static final statColorsLight = [Colors.tealAccent, Colors.teal];
  static final statColorsDark = [Colors.pinkAccent, Colors.redAccent];

  static Map<String, dynamic> _toMap() => {
      'normal': normal,
      'fire': fire,
      'fighting': fighting,
      'water': water,
      'flying': flying,
      'grass': grass,
      'poison': poison,
      'electric': electric,
      'ground': ground,
      'psychic': psychic,
      'rock': rock,
      'ice': ice,
      'bug': bug,
      'dragon': dragon,
      'ghost': ghost,
      'dark': dark,
      'steel': steel,
      'fairy': fairy,
    };

  static dynamic get(String propertyName) {
    final mapRep = _toMap();
    if (mapRep.containsKey(propertyName)) {
      return mapRep[propertyName];
    }
    return normal;
  }
}

mixin PokemonBackgroundColors {
  static const  normal = Color(0xffd2d2d2);
  static const  fire = Color(0xFFD5886D);
  static const  fighting = Color(0xFFD9798B);
  static const  water = Color(0xff78beff);
  static const  flying = Color(0xFFC2BBEE);
  static const  grass = Color(0xff95ce9e);
  static const  poison = Color(0xffd695ee);
  static const  electric = Color(0xFFF6D730);
  static const  ground = Color(0xFFF8CBB6);
  static const  psychic = Color(0xfffcd2d2);
  static const  rock = Color(0xffe1dfdd);
  static const  ice = Color(0xffc8f5e8);
  static const  bug = Color(0xFFD8F565);
  static const  dragon = Color(0xFFB094EF);
  static const  ghost = Color(0xffb8bacc);
  static const  dark = Color(0xff9c9ca1);
  static const  steel = Color(0xff9bb1b6);
  static const  fairy = Color(0xfff1cfee);

  static Map<String, dynamic> _toMap() => {
      'normal': normal,
      'fire': fire,
      'fighting': fighting,
      'water': water,
      'flying': flying,
      'grass': grass,
      'poison': poison,
      'electric': electric,
      'ground': ground,
      'psychic': psychic,
      'rock': rock,
      'ice': ice,
      'bug': bug,
      'dragon': dragon,
      'ghost': ghost,
      'dark': dark,
      'steel': steel,
      'fairy': fairy,
    };

  static dynamic get(String propertyName) {
    final mapRep = _toMap();
    if (mapRep.containsKey(propertyName)) {
      return mapRep[propertyName];
    }
    return normal;
  }
}

mixin PokemonBackgroundPhotos {
  final normal = '6985045';
  final fire = '266526';
  final fighting = '8611288';
  final water = '2860705';
  final flying = '2470655';
  final grass = '582486';
  final poison = '3109807';
  final electric = '1119976';
  final ground = '909654';
  final psychic = '924824';
  final rock = '800244';
  final ice = '219837';
  final bug = '247599';
  final dragon = '547115';
  final ghost = '7526808';
  final dark = '39561';
  final steel = '2092075';
  final fairy = '426894';

  Map<String, dynamic> _toMap() => {
      'normal': normal,
      'fire': fire,
      'fighting': fighting,
      'water': water,
      'flying': flying,
      'grass': grass,
      'poison': poison,
      'electric': electric,
      'ground': ground,
      'psychic': psychic,
      'rock': rock,
      'ice': ice,
      'bug': bug,
      'dragon': dragon,
      'ghost': ghost,
      'dark': dark,
      'steel': steel,
      'fairy': fairy,
    };

  String _getFullUrl(String id) => 'https://images.pexels.com/photos/$id/pexels-photo-$id'
        '.jpeg?auto=compress&cs=tinysrgb&h=350';

  dynamic get(String propertyName) {
    final mapRep = _toMap();
    if (mapRep.containsKey(propertyName)) {
      return _getFullUrl(mapRep[propertyName]);
    }
    return _getFullUrl(normal);
  }
}

mixin PokemonTypePicture {
  static Map<String, dynamic> _toMap() => {
    'normal': Assets.images.pokemonTypes.normal.svg(),
    'fire': Assets.images.pokemonTypes.fire.svg(),
    'fighting': Assets.images.pokemonTypes.fighting.svg(),
    'water': Assets.images.pokemonTypes.water.svg(),
    'flying': Assets.images.pokemonTypes.flying.svg(),
    'grass': Assets.images.pokemonTypes.grass.svg(),
    'poison': Assets.images.pokemonTypes.poison.svg(),
    'electric': Assets.images.pokemonTypes.electric.svg(),
    'ground': Assets.images.pokemonTypes.ground.svg(),
    'psychic': Assets.images.pokemonTypes.psychic.svg(),
    'rock': Assets.images.pokemonTypes.rock.svg(),
    'ice': Assets.images.pokemonTypes.ice.svg(),
    'bug': Assets.images.pokemonTypes.bug.svg(),
    'dragon': Assets.images.pokemonTypes.dragon.svg(),
    'ghost': Assets.images.pokemonTypes.ghost.svg(),
    'dark': Assets.images.pokemonTypes.dark.svg(),
    'steel': Assets.images.pokemonTypes.steel.svg(),
    'fairy': Assets.images.pokemonTypes.fairy.svg(),
  };

  static dynamic get(String propertyName) {
    final mapRep = _toMap();
    if (mapRep.containsKey(propertyName)) {
      return mapRep[propertyName];
    }
    return mapRep['normal'];
  }
}