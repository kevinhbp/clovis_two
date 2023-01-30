import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'stat.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Stat extends HiveObject {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);

  @HiveField(0)
  @JsonKey(name: 'base_stat')
  int baseStat;

  @HiveField(1)
  @JsonKey(name: 'effort')
  int effort;

  @HiveField(2)
  @JsonKey(name: 'stat')
  Result stat;
}
