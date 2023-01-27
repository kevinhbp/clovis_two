import 'package:flutter/material.dart';

enum ShadowType {
  none(0),
  small(4),
  moderate(12);

  const ShadowType(this.elevation);

  final double elevation;
}

enum RadiusType {
  small(6),
  moderate(12),
  subLarge(14),
  large(16),
  circle(1000);

  const RadiusType(this.value);

  final double value;

  Radius getRadius() => Radius.circular(value);

  BorderRadius getBorderRadius() => BorderRadius.circular(value);

  RoundedRectangleBorder getRoundedRectangleBorder() => RoundedRectangleBorder(
    borderRadius: getBorderRadius(),
  );
}

enum SpacingType {
  x1(4),
  x2(8),
  x3(12),
  x4(16),
  x5(20),
  x6(24),
  x7(28),
  x8(32),
  x9(36),
  x10(40);

  const SpacingType(this.value);

  final double value;

}

enum IconSize {
  micro(16),
  small(24),
  moderate(48),
  large(62);

  const IconSize(this.size);

  final double size;
}

enum ImageSize {
  s64(64),
  s128(128);

  const ImageSize(this.size);

  final double size;
}

enum DurationType {
  pageTransition(Duration(milliseconds: 200)),
  ;

  const DurationType(this.duration);
  final Duration duration;
}