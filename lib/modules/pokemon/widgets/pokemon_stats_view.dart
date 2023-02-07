import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/widgets/text/text_view.dart';
import '../../../global/data/entity/pokemon.dart';
import '../../../global/themes/poke_theme.dart';
import '../../../main.dart';

class PokemonStatsView extends StatelessWidget {
  const PokemonStatsView({
    required this.title,
    required this.pokemon,
    this.margin,
    super.key,
  });

  static const int _maxPoint = 255;
  final Pokemon pokemon;
  final EdgeInsets? margin;
  final String title;

  @override
  Widget build(BuildContext context) {
    final content = <Widget>[];
    if (pokemon.stats.isNotEmpty) {
      var totalStats = 0;
      var maxStats = 0;
      for (final e in pokemon.stats) {
        final statName = e.stat.name.toUpperCase();
        final statValue = (e.baseStat).toString();
        final statPercent = (e.baseStat).toDouble() / _maxPoint;
        maxStats += _maxPoint;
        totalStats += e.baseStat;
        content.add(PokemonStatsRowView(
          mName: statName,
          mValue: statValue,
          mPercent: statPercent,
        ));
      }
      final totalPercentage = totalStats.toDouble() / maxStats.toDouble();
      content.add(PokemonStatsRowView(
          mName: 'TOTAL',
          mValue: totalStats.toString(),
          mPercent: totalPercentage));
    }

    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            title,
            type: TypographyType.titleModerateVtMono,
          ),
          ...content,
        ],
      ),
    );
  }
}

class PokemonStatsRowView extends StatelessWidget {
  const PokemonStatsRowView({
    required this.mName,
    required this.mValue,
    required this.mPercent,
    super.key,
  });

  final String mName;
  final String mValue;
  final double mPercent;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: SpacingType.x1.value),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: TextView(
                mName,
                type: TypographyType.bodySmallVtMono,
              ),
            ),
            Expanded(
              child: TextView(
                mValue,
                type: TypographyType.bodySmallVtMono,
              ),
            ),
            Expanded(
              flex: 5,
              child: ValueListenableBuilder<ThemeMode>(
                valueListenable: MyApp.themeNotifier,
                builder: (_, currentMode, __) {
                  var mColors = PokemonColors.statColorsLight;
                  if (currentMode == ThemeMode.dark) {
                    mColors = PokemonColors.statColorsDark;
                  }
                  return LinearPercentIndicator(
                    padding: const EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 1200,
                    percent: mPercent,
                    linearGradient: LinearGradient(colors: mColors),
                    barRadius: const Radius.circular(10),
                  );
                },
              ),
            )
          ],
        ),
      );
}
