import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bin/themes/our_colors.dart';
import '../bin/themes/our_text_style.dart';

class AppColor {
  AppColor._();

  static ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: OurColors.primary.c40,
    onPrimary: OurColors.primary.c100,
    primaryContainer: OurColors.primary.c90,
    onPrimaryContainer: OurColors.primary.c10,
    secondary: OurColors.secondary.c40,
    onSecondary: OurColors.secondary.c100,
    secondaryContainer: OurColors.secondary.c90,
    onSecondaryContainer: OurColors.secondary.c10,
    tertiary: OurColors.tertiary.c40,
    onTertiary: OurColors.tertiary.c100,
    tertiaryContainer: OurColors.tertiary.c90,
    onTertiaryContainer: OurColors.tertiary.c10,
    error: OurColors.error.c40,
    onError: OurColors.error.c100,
    errorContainer: OurColors.error.c90,
    onErrorContainer: OurColors.error.c10,
    background: OurColors.neutral.c90,
    onBackground: OurColors.neutral.c10,
    surface: OurColors.neutral.c95,
    onSurface: OurColors.neutral.c10,
    surfaceVariant: OurColors.neutralVariant.c90,
    onSurfaceVariant: OurColors.neutralVariant.c30,
    outline: OurColors.neutralVariant.c50,
  );

  static ColorScheme darkScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: OurColors.primary.c80,
      onPrimary: OurColors.primary.c20,
      primaryContainer: OurColors.primary.c30,
      onPrimaryContainer: OurColors.primary.c90,
      secondary: OurColors.secondary.c80,
      onSecondary: OurColors.secondary.c20,
      secondaryContainer: OurColors.secondary.c30,
      onSecondaryContainer: OurColors.secondary.c90,
      tertiary: OurColors.tertiary.c80,
      onTertiary: OurColors.tertiary.c20,
      tertiaryContainer: OurColors.tertiary.c30,
      onTertiaryContainer: OurColors.tertiary.c90,
      error: OurColors.error.c80,
      onError: OurColors.error.c20,
      errorContainer: OurColors.error.c30,
      onErrorContainer: OurColors.error.c90,
      background: OurColors.neutral.c10,
      onBackground: OurColors.neutral.c90,
      surface: OurColors.neutral.c10,
      onSurface: OurColors.neutral.c80,
      surfaceVariant: OurColors.neutralVariant.c30,
      onSurfaceVariant: OurColors.neutralVariant.c80,
      outline: OurColors.neutralVariant.c60);
}


mixin AppTheme {
  static const SystemUiOverlayStyle defaultOverlay = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark);

  static final mTextThemeLight = TextTheme(
    displayLarge: OurTextTheme.displayLarge.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    displayMedium: OurTextTheme.displayModerate.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    displaySmall: OurTextTheme.displaySmall.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    headlineLarge: OurTextTheme.headlineLarge.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    headlineMedium: OurTextTheme.headlineModerate.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    headlineSmall: OurTextTheme.headlineSmall.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    titleLarge: OurTextTheme.titleLarge.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    titleMedium: OurTextTheme.titleModerate.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    titleSmall: OurTextTheme.titleSmall.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    labelLarge: OurTextTheme.labelLarge.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    labelMedium: OurTextTheme.labelModerate.copyWith(
      color: ComponentColors.text.textBlack2
    ),
    labelSmall: OurTextTheme.labelSmall.copyWith(
      color: ComponentColors.text.textBlack2
    ),
  );

  static final mTextThemeDark = TextTheme(
    displayLarge: OurTextTheme.displayLarge.copyWith(
      color: ComponentColors.text.textWhite1
    ),
    displayMedium: OurTextTheme.displayModerate.copyWith(
        color: ComponentColors.text.textWhite1
    ),
    displaySmall: OurTextTheme.displaySmall.copyWith(
        color: ComponentColors.text.textWhite1
    ),
    headlineLarge: OurTextTheme.headlineLarge.copyWith(
        color: ComponentColors.text.textWhite1
    ),
    headlineMedium: OurTextTheme.headlineModerate.copyWith(
        color: ComponentColors.text.textWhite1
    ),
    headlineSmall: OurTextTheme.headlineSmall.copyWith(
        color: ComponentColors.text.textWhite1
    ),
    titleLarge: OurTextTheme.titleLarge.copyWith(
        color: ComponentColors.text.textWhite1
    ),
    titleMedium: OurTextTheme.titleModerate.copyWith(
        color: ComponentColors.text.textWhite1
    ),
    titleSmall: OurTextTheme.titleSmall.copyWith(
        color: ComponentColors.text.textWhite1
    ),
    labelLarge: OurTextTheme.labelLarge.copyWith(
        color: ComponentColors.text.textWhite1
    ),
    labelMedium: OurTextTheme.labelModerate.copyWith(
        color: ComponentColors.text.textWhite1
    ),
    labelSmall: OurTextTheme.labelSmall.copyWith(
        color: ComponentColors.text.textWhite1
    ),
  );

  static final light = ThemeData(
    fontFamily: 'Rubik',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: false,
    colorScheme: AppColor.lightScheme,
    brightness: AppColor.lightScheme.brightness,
    primaryColor: AppColor.lightScheme.primary,
    backgroundColor: AppColor.lightScheme.background,
    textTheme: mTextThemeLight,
  );

  static final dark = ThemeData(
    fontFamily: 'Rubik',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: false,
    colorScheme: AppColor.darkScheme,
    brightness: AppColor.darkScheme.brightness,
    primaryColor: AppColor.darkScheme.primary,
    backgroundColor: AppColor.darkScheme.background,
    textTheme: mTextThemeDark,
  );
}