import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({
    required this.size,
    required this.radius,
    required this.child,
    this.margin,
    this.background,
    super.key,
  });

  final double size;
  final double radius;
  final Widget child;
  final EdgeInsets? margin;
  final Color? background;

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size,
            height: size,
            color: background,
            child: child,
          ),
        ),
      );
}
