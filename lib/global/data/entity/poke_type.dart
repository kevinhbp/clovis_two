import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'poke_type.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class PokeType extends HiveObject {
  PokeType({
    required this.slot,
    required this.type,
  });

  factory PokeType.fromJson(Map<String, dynamic> json) => _$PokeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokeTypeToJson(this);

  @HiveField(0)
  @JsonKey(name: 'slot')
  int slot;

  @HiveField(1)
  @JsonKey(name: 'type')
  Result type;
}
