import 'package:flutter/material.dart';

import '../data/view_type.dart';
import 'our_colors.dart';
import 'our_text_style.dart';

mixin OurEditTextTheme {
  static final ourInputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    labelStyle: OurTextTheme.labelLarge,
    hintStyle: OurTextTheme.labelModerate,
    helperStyle: OurTextTheme.labelModerate,
    errorStyle: OurTextTheme.labelSmall.copyWith(
      color: ComponentColors.text.textRed1,
    ),
    counterStyle: OurTextTheme.bodySmall.copyWith(
      color: ComponentColors.text.textGray1,
    ),
    suffixStyle: OurTextTheme.labelModerate.copyWith(
      color: ComponentColors.text.textGray1,
    ),
    prefixStyle: OurTextTheme.labelModerate.copyWith(
      color: ComponentColors.text.textGray1,
    ),
    errorMaxLines: 3,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
  );

  static final ourSearchInputDecoration = InputDecoration(
    filled: true,
    fillColor: ComponentColors.background.searchBox,
    border: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: const BorderSide(
        width: 1.6,
        color: Colors.transparent,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: const BorderSide(
        width: 1.6,
        color: Colors.transparent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: const BorderSide(
        width: 1.6,
        color: Colors.transparent,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: const BorderSide(
        width: 1.6,
        color: Colors.transparent,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: const BorderSide(
        width: 1.6,
        color: Colors.transparent,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: const BorderSide(
        width: 1.6,
        color: Colors.transparent,
      ),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: OurTextTheme.labelLarge,
    hintStyle: OurTextTheme.labelModerate,
    helperStyle: OurTextTheme.labelModerate,
    errorStyle: OurTextTheme.labelSmall.copyWith(
      color: ComponentColors.text.textRed1,
    ),
    counterStyle: OurTextTheme.bodySmall.copyWith(
      color: ComponentColors.text.textGray1,
    ),
    suffixStyle: OurTextTheme.labelModerate.copyWith(
      color: ComponentColors.text.textGray1,
    ),
    prefixStyle: OurTextTheme.labelModerate.copyWith(
      color: ComponentColors.text.textGray1,
    ),
    errorMaxLines: 3,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
  );
}
