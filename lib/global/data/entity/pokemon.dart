import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';
import 'poke_type.dart';
import 'result.dart';
import 'stat.dart';

part 'pokemon.g.dart';

@JsonSerializable()
@HiveType(typeId: 5)
class Pokemon extends HiveObject {
  Pokemon({
    required this.name,
    required this.id,
    required this.types,
    required this.height,
    required this.weight,
    required this.stats,
    required this.abilities,
    required this.baseExp,
    required this.species,
    this.photoFilePath,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  @HiveField(0)
  @JsonKey(name: 'name')
  String name;

  @HiveField(1)
  @JsonKey(name: 'id')
  int id;

  @HiveField(2)
  @JsonKey(name: 'types')
  List<PokeType> types;

  @HiveField(3)
  @JsonKey(name: 'height')
  double height;

  @HiveField(4)
  @JsonKey(name: 'weight')
  double weight;

  @HiveField(5)
  @JsonKey(name: 'stats')
  List<Stat> stats;

  @HiveField(6)
  @JsonKey(name: 'abilities')
  List<Ability> abilities;

  @HiveField(7)
  @JsonKey(name: 'base_experience')
  int baseExp;

  @HiveField(8)
  @JsonKey(name: 'species')
  Result species;

  @HiveField(9)
  @JsonKey(name: 'photoFilePath')
  String? photoFilePath;
}
