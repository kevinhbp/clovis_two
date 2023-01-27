import 'package:flutter/material.dart';

class ContentLine extends StatelessWidget {
  ContentLine({
    this.size = 1,
    this.color,
    this.margin,
    Key? key,
  }) : super(key: key);

  final double size;
  final Color? color;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        width: double.infinity,
        height: 1.4,
        decoration: BoxDecoration(
          color: color ?? Colors.black.withOpacity(0.03),
          borderRadius: BorderRadius.circular(2),
        ),

      );
}
