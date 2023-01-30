// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokeTypeAdapter extends TypeAdapter<PokeType> {
  @override
  final int typeId = 4;

  @override
  PokeType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokeType(
      slot: fields[0] as int,
      type: fields[1] as Result,
    );
  }

  @override
  void write(BinaryWriter writer, PokeType obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.slot)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeType _$PokeTypeFromJson(Map<String, dynamic> json) => PokeType(
      slot: json['slot'] as int,
      type: Result.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokeTypeToJson(PokeType instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
