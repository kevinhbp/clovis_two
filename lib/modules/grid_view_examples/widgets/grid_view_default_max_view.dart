import 'package:flutter/material.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/bin/widgets/text/text_view.dart';

class GridViewDefaultMaxView extends StatelessWidget {
  const GridViewDefaultMaxView({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 300,
        margin: EdgeInsets.symmetric(
          horizontal: SpacingType.x2.value,
          vertical: SpacingType.x1.value,
        ),
        padding: EdgeInsets.all(SpacingType.x1.value),
        decoration: BoxDecoration(
          border: Border.all(
            color: OurColors.neutral.c60,
            width: 0.8,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextView('GridView (default-max)',
                type: TypographyType.titleSmall),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1,
                ),
                children: [
                  Container(
                    color: Colors.greenAccent,
                  ),
                  Container(
                    color: Colors.blueAccent,
                  ),
                  Container(
                    color: Colors.redAccent,
                  ),
                  Container(
                    color: Colors.yellowAccent,
                  ),
                  Container(
                    color: Colors.purpleAccent,
                  ),
                  Container(
                    color: Colors.cyanAccent,
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
