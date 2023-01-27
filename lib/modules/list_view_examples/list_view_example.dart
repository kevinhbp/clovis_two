import 'package:flutter/material.dart';

import '../../global/bin/widgets/text/text_view.dart';
import 'widgets/list_view_builder_view.dart';
import 'widgets/list_view_default_view.dart';
import 'widgets/list_view_seperated_view.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const TextView(
            'ListView examples',
            type: TypographyType.titleSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              ListViewSeparatedView(),
              ListViewBuilderView(),
              ListViewDefaultView(),
            ],
          ),
        ),
      );
}
