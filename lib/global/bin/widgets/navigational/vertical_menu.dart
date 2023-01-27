import 'package:flutter/material.dart';

import '../../data/view_type.dart';
import 'navigation_button.dart';

class VerticalMenu extends StatelessWidget {
  const VerticalMenu({
    required this.items,
    this.width = 250,
    this.decoration,
    Key? key,
  }) : super(key: key);

  final double width;
  final Decoration? decoration;

  final List<NavigationButton> items;

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: MediaQuery.of(context).size.height,
      decoration: decoration,
      padding: EdgeInsets.symmetric(vertical: SpacingType.x1.value),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...items,
          ],
        ),
      ),
    );
  }
}
