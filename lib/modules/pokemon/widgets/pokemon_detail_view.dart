import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/bin/widgets/image/image_view.dart';
import '../../../global/bin/widgets/text/text_view.dart';
import '../../../global/data/entity/pokemon.dart';
import '../../../global/strings/strings.dart';
import '../../../global/themes/app_theme.dart';
import '../../../global/themes/poke_theme.dart';
import '../../../global/utils/pokemon_util.dart';
import 'pokemon_stats_view.dart';
import 'pokemon_types_view.dart';

class PokemonDetailView extends StatelessWidget {
  PokemonDetailView({
    required this.item,
    this.onTapClose,
    Key? key,
  }) : super(key: key);

  final Pokemon item;
  final Function()? onTapClose;

  @override
  Widget build(BuildContext context) {
    if (item.id == 0) {
      return const _NoSelectedPokemonView();
    }

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        _PokemonHeaderView(item: item, onTapClose: onTapClose),
      ],
      body: Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: SpacingType.x4.value,
                  left: SpacingType.x5.value,
                  right: SpacingType.x5.value,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView(
                      Strings.height,
                      type: TypographyType.labelSmall,
                      color: ComponentColors.text.textGray1,
                    ),
                    Expanded(child: Container()),
                    PokemonTypesView(item: item, size: 32),
                    Expanded(child: Container()),
                    TextView(
                      Strings.weight,
                      type: TypographyType.labelSmall,
                      color: ComponentColors.text.textGray1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SpacingType.x5.value,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      alignment: Alignment.centerLeft,
                      child: TextView(
                        getHeightInMeters(item.height),
                        type: TypographyType.bodyModerateRubik,
                      ),
                    ),
                    Expanded(child: Container()),
                    _PokemonTypeTextView(item: item),
                    Expanded(child: Container()),
                    Container(
                      width: 80,
                      alignment: Alignment.centerRight,
                      child: TextView(
                        getWeightInKg(item.weight),
                        type: TypographyType.bodyModerateRubik,
                      ),
                    )
                  ],
                ),
              ),
              PokemonStatsView(
                title: 'Base Stats',
                pokemon: item,
                margin: EdgeInsets.only(
                  left: SpacingType.x5.value,
                  right: SpacingType.x5.value,
                  top: SpacingType.x3.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoSelectedPokemonView extends StatelessWidget {
  const _NoSelectedPokemonView();

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Blur(
            blur: 6,
            blurColor: Colors.black,
            colorOpacity: 0.25,
            child: SizedBox(
              width: context.width,
              height: context.height,
              child: const ImageView(
                imageUrl: 'https://images.pexels'
                    '.com/photos/9661258/pexels-photo-9661258'
                    '.jpeg?auto=compress&cs=tinysrgb&h=350',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.medium,
              ),
            ),
          ),
          Center(
            child: TextView(
              Strings.selectAPokemonFirst,
              type: TypographyType.headlineSmallVtMono,
              color: ComponentColors.text.textWhite1,
            ),
          ),
        ],
      );
}

class _PokemonHeaderView extends StatelessWidget {
  _PokemonHeaderView({required this.item, required this.onTapClose});

  final Pokemon item;
  final Function()? onTapClose;

  Widget getCloseButton() => IconButton(
        onPressed: onTapClose,
        color: ComponentColors.text.textWhite1,
        icon: const Icon(Icons.close_rounded),
      );

  List<Widget> getActionWidgets() {
    final result = <Widget>[];
    if (onTapClose != null) {
      result.add(getCloseButton());
    }
    return result;
  }

  Color getBackgroundColor(BuildContext context) {
    final types = item.types;
    if (types.isNotEmpty) {
      final firstType = types[0].type.name.toLowerCase();
      return PokemonColors.get(firstType);
    }
    return ComponentColors.background.background;
  }

  Widget getTitleWidget(BuildContext context) {
    final title = '#${item.id}: ${item.name.capitalizeFirst}';
    return TextView(title, type: TypographyType.appBarRubik);
  }

  Widget getBackgroundWidget(BuildContext context) {
    final mSpritesUrl = getSpritesById(item.id);
    /*final extension = path.extension(mSpritesUrl);
    var mFileName = 'pokemon_${item.name}_${item.id}$extension';
    var preFilePath = item.photoFilePath ?? '';*/

    return Stack(
      fit: StackFit.expand,
      children: [
        Blur(
          blurColor: Colors.black,
          blur: 19,
          colorOpacity: 0.35,
          child: ImageView(
            width: context.width,
            height: context.height,
            imageUrl: mSpritesUrl,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),
        ),
        Align(
          child: SizedBox(
            width: 200,
            child: ImageView(
              imageUrl: mSpritesUrl,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => SliverAppBar(
        expandedHeight: 200,
        pinned: true,
        actions: getActionWidgets(),
        iconTheme: IconThemeData(color: ComponentColors.text.textWhite1),
        systemOverlayStyle: AppTheme.defaultOverlay,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
        backgroundColor: getBackgroundColor(context),
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.only(bottom: 10),
          centerTitle: true,
          title: getTitleWidget(context),
          expandedTitleScale: 1,
          background: getBackgroundWidget(context),
        ),
      );
}

class _PokemonTypeTextView extends StatelessWidget {
  _PokemonTypeTextView({
    required this.item,
    Key? key,
  }) : super(key: key);

  final Pokemon item;

  @override
  Widget build(BuildContext context) {
    final types = item.types;
    final children = <Widget>[];
    for (final element in types) {
      final typeName = element.type.name.capitalizeFirst ?? '';
      final color = PokemonColors.get(typeName.toLowerCase());
      if (typeName.isNotEmpty) {
        if (children.isNotEmpty) {
          children.add(
            const TextView(
              ' / ',
              type: TypographyType.bodyLargeRubik,
            ),
          );
        }
        children.add(TextView(
          typeName.capitalizeFirst ?? '',
          type: TypographyType.bodyLargeRubik,
          color: color,
        ));
      }
    }
    return Row(children: children);
  }
}
