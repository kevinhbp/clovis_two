import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/bin/widgets/text/text_view.dart';
import '../../../global/data/entity/pokemon.dart';
import '../../../global/utils/pokemon_util.dart';
import '../../../global/widgets/loading_view.dart';
import '../../pokemon/widgets/pokemon_types_view.dart';

class PokemonItemView extends StatelessWidget {
  const PokemonItemView({required this.item, super.key});

  final Pokemon item;

  @override
  Widget build(BuildContext context) => _WrapperView(
        onTap: () {},
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: _PokeImage(item: item),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: _PokeId(item: item),
            ),
            Center(
              child: _PokeIdentity(item: item),
            )
          ],
        ),
      );
}

class _WrapperView extends StatelessWidget {
  _WrapperView({required this.onTap, required this.child});

  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => Card(
        elevation: ShadowType.small.elevation,
        margin: EdgeInsets.only(
          left: SpacingType.x3.value,
          right: SpacingType.x3.value,
          top: SpacingType.x2.value,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: RadiusType.moderate.getBorderRadius(),
          side: BorderSide(color: Theme.of(context).canvasColor),
        ),
        child: SizedBox(
          height: 80,
          child: InkWell(
            onTap: onTap,
            borderRadius: RadiusType.moderate.getBorderRadius(),
            child: child,
          ),
        ),
      );
}

class _PokeImage extends StatelessWidget {
  const _PokeImage({required this.item});

  final Pokemon item;

  @override
  Widget build(BuildContext context) {
    final sprites = getSpritesById(item.id);
    return Container(
      width: 100,
      margin: EdgeInsets.only(
        left: SpacingType.x1.value,
      ),
      child: CachedNetworkImage(
        imageUrl: sprites,
        filterQuality: FilterQuality.medium,
        fit: BoxFit.fitHeight,
        placeholder: (context, url) => LoadingView(
          loading: Assets.loader.loading2,
        ),
      ),
    );
  }
}

class _PokeId extends StatelessWidget {
  const _PokeId({required this.item});

  final Pokemon item;

  @override
  Widget build(BuildContext context) {
    final mId = '#${item.id}';
    return Container(
      margin: EdgeInsets.only(
        right: SpacingType.x2.value,
      ),
      child: TextView(
        mId,
        type: TypographyType.headlineLargeVtMono,
        color: ComponentColors.text.textGray1,
      ),
    );
  }
}

class _PokeIdentity extends StatelessWidget {
  const _PokeIdentity({required this.item});

  final Pokemon item;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: SpacingType.x3.value),
              child: TextView(
                item.name.capitalizeFirst.toString(),
                type: TypographyType.titleLargeRubik,
              ),
            ),
            Expanded(child: Container()),
            PokemonTypesView(item: item),
          ],
        ),
      );
}
