import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/bin/widgets/text/text_view.dart';
import '../../../global/data/entity/pokemon.dart';
import '../../../global/themes/poke_theme.dart';

class PokemonAbilitiesView extends StatelessWidget {
  const PokemonAbilitiesView({
    required this.title,
    required this.item,
    this.size = 24,
    this.spaceBetween = 4,
    this.margin,
    super.key,
  });

  final Pokemon item;
  final String title;
  final double size;
  final double spaceBetween;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (item.abilities.isEmpty) {
      return Container();
    }
    var color = ComponentColors.button.primaryActive;
    if (item.types.isNotEmpty) {
      final firstType = item.types[0].type.name.toLowerCase();
      color = PokemonBackgroundColors.get(firstType);
    }
    for (final e in item.abilities) {
      final ability = e.ability.name;
      final item = Chip(
        backgroundColor: color,
        label: TextView(
          ability.capitalizeFirst ?? '',
          type: TypographyType.bodyModerateRubik,
          color: ComponentColors.text.textBlack1,
        ),
      );
      children.add(item);
    }
    return Container(
      width: context.width,
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            title,
            type: TypographyType.titleModerateVtMono,
          ),
          SizedBox(
            height: SpacingType.x1.value,
          ),
          Wrap(
            spacing: SpacingType.x2.value,
            children: children,
          )
        ],
      ),
    );
  }
}
