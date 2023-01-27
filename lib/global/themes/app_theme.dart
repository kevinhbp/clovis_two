import 'package:flutter/material.dart';

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
  static const mTextTheme = TextTheme(
    displayLarge: OurTextTheme.displayLarge,
    displayMedium: OurTextTheme.displayModerate,
    displaySmall: OurTextTheme.displaySmall,
    headlineLarge: OurTextTheme.headlineLarge,
    headlineMedium: OurTextTheme.headlineModerate,
    headlineSmall: OurTextTheme.headlineSmall,
    titleLarge: OurTextTheme.titleLarge,
    titleMedium: OurTextTheme.titleModerate,
    titleSmall: OurTextTheme.titleSmall,
    labelLarge: OurTextTheme.labelLarge,
    labelMedium: OurTextTheme.labelModerate,
    labelSmall: OurTextTheme.labelSmall,
  );

  static final light = ThemeData(
    fontFamily: 'Hauora',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: false,
    colorScheme: AppColor.lightScheme,
    brightness: AppColor.lightScheme.brightness,
    primaryColor: AppColor.lightScheme.primary,
    backgroundColor: AppColor.lightScheme.background,
    scaffoldBackgroundColor: AppColor.lightScheme.background,
    textTheme: mTextTheme,
  );

  static final dark = ThemeData(
    fontFamily: 'Hauora',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: false,
    colorScheme: AppColor.darkScheme,
    brightness: AppColor.darkScheme.brightness,
    primaryColor: AppColor.darkScheme.primary,
    backgroundColor: AppColor.darkScheme.background,
    textTheme: mTextTheme,
  );
}