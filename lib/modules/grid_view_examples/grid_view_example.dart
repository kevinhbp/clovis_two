import 'package:flutter/material.dart';

import '../../global/bin/widgets/text/text_view.dart';
import 'widgets/grid_view_builder_view.dart';
import 'widgets/grid_view_count_view.dart';
import 'widgets/grid_view_default_fixed_view.dart';
import 'widgets/grid_view_default_max_view.dart';
import 'widgets/grid_view_extent_view.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const TextView(
            'GridView examples',
            type: TypographyType.titleSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              GridViewDefaultFixedView(),
              GridViewDefaultMaxView(),
              GridViewCountView(),
              GridViewExtentView(),
              GridViewBuilderView(),
            ],
          ),
        ),
      );
}
