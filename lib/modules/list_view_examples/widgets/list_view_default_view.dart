import 'package:flutter/material.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/bin/widgets/text/text_view.dart';

class ListViewDefaultView extends StatelessWidget {
  const ListViewDefaultView({super.key});

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
            const TextView('ListView (default)',
                type: TypographyType.titleSmall),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 60,
                    color: Colors.greenAccent,
                  ),
                  Container(
                    height: 60,
                    color: Colors.blueAccent,
                  ),
                  Container(
                    height: 60,
                    color: Colors.redAccent,
                  ),
                  Container(
                    height: 60,
                    color: Colors.yellowAccent,
                  ),
                  Container(
                    height: 60,
                    color: Colors.purpleAccent,
                  ),
                  Container(
                    height: 60,
                    color: Colors.cyanAccent,
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
