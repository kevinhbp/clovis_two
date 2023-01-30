// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AbilityAdapter extends TypeAdapter<Ability> {
  @override
  final int typeId = 2;

  @override
  Ability read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ability(
      ability: fields[0] as Result,
      isHidden: fields[1] as bool,
      slot: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Ability obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ability)
      ..writeByte(1)
      ..write(obj.isHidden)
      ..writeByte(2)
      ..write(obj.slot);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbilityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      ability: Result.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool,
      slot: json['slot'] as int,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };
