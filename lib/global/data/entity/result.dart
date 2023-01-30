import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Result extends HiveObject {
  Result({
    required this.name,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @HiveField(0)
  @JsonKey(name: 'name')
  String name;

  @HiveField(1)
  @JsonKey(name: 'url')
  String url;
}
