import 'package:flutter/material.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/data/entity/poke_type.dart';
import '../../../global/data/entity/pokemon.dart';
import '../../../global/themes/poke_theme.dart';

class PokemonTypesView extends StatelessWidget {
  const PokemonTypesView({required this.item, super.key});

  final Pokemon item;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (final element in item.types) {
      if (children.isNotEmpty) {
        children.add(SizedBox(width: SpacingType.x1.value));
      }
      children.add(PokemonTypeIcon(item: element));
    }
    return Container(
      margin: EdgeInsets.only(
        bottom: SpacingType.x1.value,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SpacingType.x1.value,
        vertical: SpacingType.x1.value,
      ),
      decoration: BoxDecoration(
          color: OurColors.neutralVariant.c95,
          borderRadius: BorderRadius.all(RadiusType.circle.getRadius())),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [...children],
      ),
    );
  }
}

class PokemonTypeIcon extends StatelessWidget {
  const PokemonTypeIcon({required this.item, super.key});

  final PokeType item;

  @override
  Widget build(BuildContext context) {
    const size = 24.0;
    final typeName = item.type.name.toLowerCase();
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(SpacingType.x1.value),
      decoration: BoxDecoration(
        borderRadius: RadiusType.circle.getBorderRadius(),
        color: PokemonColors.get(typeName),
      ),
      child: PokemonTypePicture.get(typeName),
    );
  }
}
