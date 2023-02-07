import 'package:flutter/material.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/data/entity/poke_type.dart';
import '../../../global/data/entity/pokemon.dart';
import '../../../global/themes/poke_theme.dart';

class PokemonTypesView extends StatelessWidget {
  const PokemonTypesView({
    required this.item,
    this.size = 24,
    this.spaceBetween = 4,
    super.key,
  });

  final Pokemon item;
  final double size;
  final double spaceBetween;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (final element in item.types) {
      if (children.isNotEmpty) {
        children.add(SizedBox(width: spaceBetween));
      }
      children.add(PokemonTypeIcon(
        item: element,
        size: size,
      ));
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
  const PokemonTypeIcon({
    required this.item,
    this.size = 24,
    super.key,
  });

  final PokeType item;
  final double size;

  @override
  Widget build(BuildContext context) {
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
