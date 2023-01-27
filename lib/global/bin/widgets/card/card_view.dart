import 'package:flutter/material.dart';

import '../../data/view_type.dart';

class CardView extends StatelessWidget {
  CardView({
    required this.child,
    this.shadowType = ShadowType.small,
    this.radiusType = RadiusType.moderate,
    this.color,
    this.margin,
    this.padding,
    this.background,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final ShadowType shadowType;
  final RadiusType radiusType;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final DecorationImage? background;

  @override
  Widget build(BuildContext context) => Card(
    margin: margin,
    shape: RoundedRectangleBorder(
        borderRadius: radiusType.getBorderRadius(),
    ),
    elevation: shadowType.elevation,
    child: ClipRRect(
      borderRadius: radiusType.getBorderRadius(),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.surface,
          image: background,
        ),
        child: child,
      ),
    ),
  );
}