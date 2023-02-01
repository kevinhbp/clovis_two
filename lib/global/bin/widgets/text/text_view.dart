import 'package:flutter/widgets.dart';

import '../../themes/our_text_style.dart';

enum TypographyType {
  displayLarge(OurTextTheme.displayLarge),
  displayModerate(OurTextTheme.displayModerate),
  displaySmall(OurTextTheme.displaySmall),
  headlineLarge(OurTextTheme.headlineLarge),
  headlineModerate(OurTextTheme.headlineModerate),
  headlineSmall(OurTextTheme.headlineSmall),
  headlineMicro(OurTextTheme.headlineMicro),
  titleLarge(OurTextTheme.titleLarge),
  titleModerate(OurTextTheme.titleModerate),
  titleSmall(OurTextTheme.titleSmall),
  titleMicro(OurTextTheme.titleMicro),
  labelLarge(OurTextTheme.labelLarge),
  labelModerate(OurTextTheme.labelModerate),
  labelSmall(OurTextTheme.labelSmall),
  bodyLarge(OurTextTheme.bodyLarge),
  bodyModerate(OurTextTheme.bodyModerate),
  bodySmall(OurTextTheme.bodySmall),

  displayLargeRubik(OurTextThemeRubik.displayLarge),
  displayModerateRubik(OurTextThemeRubik.displayModerate),
  displaySmallRubik(OurTextThemeRubik.displaySmall),
  headlineLargeRubik(OurTextThemeRubik.headlineLarge),
  headlineModerateRubik(OurTextThemeRubik.headlineModerate),
  headlineSmallRubik(OurTextThemeRubik.headlineSmall),
  headlineMicroRubik(OurTextThemeRubik.headlineMicro),
  titleLargeRubik(OurTextThemeRubik.titleLarge),
  titleModerateRubik(OurTextThemeRubik.titleModerate),
  titleSmallRubik(OurTextThemeRubik.titleSmall),
  titleMicroRubik(OurTextThemeRubik.titleMicro),
  labelLargeRubik(OurTextThemeRubik.labelLarge),
  labelModerateRubik(OurTextThemeRubik.labelModerate),
  labelSmallRubik(OurTextThemeRubik.labelSmall),
  bodyLargeRubik(OurTextThemeRubik.bodyLarge),
  bodyModerateRubik(OurTextThemeRubik.bodyModerate),
  bodySmallRubik(OurTextThemeRubik.bodySmall),

  displayLargeVtMono(OurTextThemeVtMono.displayLarge),
  displayModerateVtMono(OurTextThemeVtMono.displayModerate),
  displaySmallVtMono(OurTextThemeVtMono.displaySmall),
  headlineLargeVtMono(OurTextThemeVtMono.headlineLarge),
  headlineModerateVtMono(OurTextThemeVtMono.headlineModerate),
  headlineSmallVtMono(OurTextThemeVtMono.headlineSmall),
  headlineMicroVtMono(OurTextThemeVtMono.headlineMicro),
  titleLargeVtMono(OurTextThemeVtMono.titleLarge),
  titleModerateVtMono(OurTextThemeVtMono.titleModerate),
  titleSmallVtMono(OurTextThemeVtMono.titleSmall),
  titleMicroVtMono(OurTextThemeVtMono.titleMicro),
  labelLargeVtMono(OurTextThemeVtMono.labelLarge),
  labelModerateVtMono(OurTextThemeVtMono.labelModerate),
  labelSmallVtMono(OurTextThemeVtMono.labelSmall),
  bodyLargeVtMono(OurTextThemeVtMono.bodyLarge),
  bodyModerateVtMono(OurTextThemeVtMono.bodyModerate),
  bodySmallVtMono(OurTextThemeVtMono.bodySmall),

  displayLargeHauora(OurTextThemeHauora.displayLarge),
  displayModerateHauora(OurTextThemeHauora.displayModerate),
  displaySmallHauora(OurTextThemeHauora.displaySmall),
  headlineLargeHauora(OurTextThemeHauora.headlineLarge),
  headlineModerateHauora(OurTextThemeHauora.headlineModerate),
  headlineSmallHauora(OurTextThemeHauora.headlineSmall),
  headlineMicroHauora(OurTextThemeHauora.headlineMicro),
  titleLargeHauora(OurTextThemeHauora.titleLarge),
  titleModerateHauora(OurTextThemeHauora.titleModerate),
  titleSmallHauora(OurTextThemeHauora.titleSmall),
  titleMicroHauora(OurTextThemeHauora.titleMicro),
  labelLargeHauora(OurTextThemeHauora.labelLarge),
  labelModerateHauora(OurTextThemeHauora.labelModerate),
  labelSmallHauora(OurTextThemeHauora.labelSmall),
  bodyLargeHauora(OurTextThemeHauora.bodyLarge),
  bodyModerateHauora(OurTextThemeHauora.bodyModerate),
  bodySmallHauora(OurTextThemeHauora.bodySmall),

  appBarRubik(OurTextThemeRubik.appBar);

  const TypographyType(this.value);

  final TextStyle value;
}

class TextView extends StatelessWidget {
  const TextView(this.data, {
    required this.type,
    Key? key,
    this.color,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  }) : super(key: key);

  final String data;
  final TypographyType type;
  final Color? color;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  @override
  Widget build(BuildContext context) =>
      Text(data,
          style: type.value.copyWith(
            color: color,
          ),
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow ?? TextOverflow.ellipsis,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          key: key);
}
