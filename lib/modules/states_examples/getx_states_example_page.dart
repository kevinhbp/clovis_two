import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/bin/widgets/button/button_view.dart';
import '../../global/bin/widgets/text/text_view.dart';
import 'getx_states_example_page_controller.dart';
import 'widgets/square_widget.dart';

class GetxStatesExamplePage extends StatelessWidget {
  const GetxStatesExamplePage({super.key});

  @override
  Widget build(BuildContext context) =>
      GetBuilder<GetxStatesExamplePageController>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const TextView(
              'GetX State Example',
              type: TypographyType.titleSmall,
            ),
          ),
          body: Column(
            children: [
              Obx(
                () => SquareWidget(mode: controller.squareMode.value),
              ),
              ButtonView(
                state: ButtonState.active,
                label: 'Toggle Mode',
                onPressed: () {
                  controller.toggleMode();
                },
              ),
            ],
          ),
        ),
      );
}
