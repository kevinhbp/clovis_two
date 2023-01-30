import 'package:json_annotation/json_annotation.dart';

import '../entity/result.dart';

part 'pokemon_list.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonList {
  PokemonList({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) => _$PokemonListFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListToJson(this);

  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'results')
  final List<Result> results;

  @JsonKey(name: 'next')
  final String? next;

  @JsonKey(name: 'previous')
  final String? previous;
}
