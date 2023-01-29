import 'package:flutter/material.dart';

import '../../global/bin/widgets/button/button_view.dart';
import '../../global/bin/widgets/text/text_view.dart';
import 'widgets/square_widget.dart';

class StatesExamplePage extends StatefulWidget {
  const StatesExamplePage({super.key});
  @override
  State createState() => _StateStatesExamplesPage();
}

class _StateStatesExamplesPage extends State<StatesExamplePage> {
  int mode = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const TextView(
            'States Examples',
            type: TypographyType.titleSmall,
          ),
        ),
        body: Column(
          children: [
            SquareWidget(mode: mode),
            ButtonView(
              state: ButtonState.active,
              label: 'Change Mode',
              onPressed: () {
                setState(() {
                  if (mode == 0) {
                    mode = 1;
                  } else {
                    mode = 0;
                  }
                });
              },
            ),
          ],
        ),
      );
}