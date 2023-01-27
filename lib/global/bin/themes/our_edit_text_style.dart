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
      borderSide: BorderSide(
        width: 1.6,
        color: ComponentColors.background.searchBoxOutline,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: BorderSide(
        width: 1.6,
        color: ComponentColors.background.searchBoxOutline,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: BorderSide(
        width: 1.6,
        color: ComponentColors.background.searchBoxOutlineFocused,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: BorderSide(
        color: ComponentColors.background.searchBox,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: BorderSide(
        width: 1.6,
        color: ComponentColors.background.searchBoxOutline,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: RadiusType.circle.getBorderRadius(),
      borderSide: BorderSide(
        width: 1.6,
        color: ComponentColors.background.searchBoxOutline,
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
