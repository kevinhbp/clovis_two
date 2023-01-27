import 'dart:ui';

import 'package:flutter/material.dart';

import 'navigation_button.dart';

class HorizontalMenu extends StatelessWidget {
  const HorizontalMenu({
    required this.items,
    this.height = 58,
    this.decoration,
    Key? key,
  }) : super(key: key);

  final double height;
  final Decoration? decoration;

  final List<NavigationButton> items;

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: decoration,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        }),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...items,
            ],
          ),
        ),
      ),
    );
  }
}
