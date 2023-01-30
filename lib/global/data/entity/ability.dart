import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'result.dart';

part 'ability.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Ability extends HiveObject {
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);

  @HiveField(0)
  @JsonKey(name: 'ability')
  Result ability;

  @HiveField(1)
  @JsonKey(name: 'is_hidden')
  bool isHidden;

  @HiveField(2)
  @JsonKey(name: 'slot')
  int slot;
}
