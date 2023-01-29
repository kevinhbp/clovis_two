import 'package:flutter/material.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/bin/widgets/text/text_view.dart';


class SquareWidget extends StatelessWidget {
  const SquareWidget({required this.mode, super.key});

  final int mode;

  @override
  Widget build(BuildContext context) => Container(
    height: 40,
    margin: EdgeInsets.all(SpacingType.x4.value),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: mode.isOdd ? Colors.red : Colors.blue,
      borderRadius: RadiusType.small.getBorderRadius(),
    ),
    child: TextView(
      'Mode: $mode',
      type: TypographyType.bodyLarge,
      color: ComponentColors.text.textWhite1,
    ),
  );
}
