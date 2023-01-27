import 'package:flutter/material.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/bin/widgets/text/text_view.dart';

class ListViewBuilderView extends StatelessWidget {
  const ListViewBuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = <String>[
      'Jakarta',
      'Bangkok',
      'Seoul',
      'Sydney',
      'Lisbon',
      'Beijing',
      'Tokyo',
    ];
    return Container(
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
          const TextView('ListView (builder)', type: TypographyType.titleSmall),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Container(
                height: 60,
                color: Colors.black12,
                margin: EdgeInsets.only(bottom: SpacingType.x1.value),
                alignment: Alignment.center,
                child: TextView(data[index], type: TypographyType.bodyModerate),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
