// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  final int typeId = 5;

  @override
  Pokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pokemon(
      name: fields[0] as String,
      id: fields[1] as int,
      types: (fields[2] as List).cast<PokeType>(),
      height: fields[3] as double,
      weight: fields[4] as double,
      stats: (fields[5] as List).cast<Stat>(),
      abilities: (fields[6] as List).cast<Ability>(),
      baseExp: fields[7] as int,
      species: fields[8] as Result,
      photoFilePath: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.types)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.stats)
      ..writeByte(6)
      ..write(obj.abilities)
      ..writeByte(7)
      ..write(obj.baseExp)
      ..writeByte(8)
      ..write(obj.species)
      ..writeByte(9)
      ..write(obj.photoFilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      name: json['name'] as String,
      id: json['id'] as int,
      types: (json['types'] as List<dynamic>)
          .map((e) => PokeType.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseExp: json['base_experience'] as int,
      species: Result.fromJson(json['species'] as Map<String, dynamic>),
      photoFilePath: json['photoFilePath'] as String?,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'types': instance.types,
      'height': instance.height,
      'weight': instance.weight,
      'stats': instance.stats,
      'abilities': instance.abilities,
      'base_experience': instance.baseExp,
      'species': instance.species,
      'photoFilePath': instance.photoFilePath,
    };
