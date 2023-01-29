import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/bin/data/view_type.dart';
import '../../global/bin/widgets/button/button_view.dart';
import '../../global/bin/widgets/text/text_view.dart';
import '../../main.dart';
import 'landing_page_controller.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});


  @override
  Widget build(BuildContext context) => GetBuilder<LandingPageController>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const TextView(
              'Widgets Example',
              type: TypographyType.titleSmall,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(SpacingType.x4.value),
                  child: ButtonView(
                    width: ButtonWidth.infinity,
                    state: ButtonState.active,
                    label: 'List View example',
                    onPressed: () {
                      Get.toNamed(Routes.listViewPage);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: SpacingType.x4.value,
                    right: SpacingType.x4.value,
                    bottom: SpacingType.x4.value,
                  ),
                  child: ButtonView(
                    width: ButtonWidth.infinity,
                    state: ButtonState.active,
                    label: 'Grid View example',
                    onPressed: () {
                      Get.toNamed(Routes.gridViewPage);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: SpacingType.x4.value,
                    right: SpacingType.x4.value,
                    bottom: SpacingType.x4.value,
                  ),
                  child: ButtonView(
                    width: ButtonWidth.infinity,
                    state: ButtonState.active,
                    label: 'Paged List View example',
                    onPressed: () {
                      Get.toNamed(Routes.pagedListViewPage);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: SpacingType.x4.value,
                    right: SpacingType.x4.value,
                    bottom: SpacingType.x4.value,
                  ),
                  child: ButtonView(
                    type: ButtonType.secondary,
                    width: ButtonWidth.infinity,
                    state: ButtonState.active,
                    label: 'State example',
                    onPressed: () {
                      Get.toNamed(Routes.stateExamplePage);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: SpacingType.x4.value,
                    right: SpacingType.x4.value,
                    bottom: SpacingType.x4.value,
                  ),
                  child: ButtonView(
                    type: ButtonType.secondary,
                    width: ButtonWidth.infinity,
                    state: ButtonState.active,
                    label: 'Getx State example',
                    onPressed: () {
                      Get.toNamed(Routes.getxStateExamplePage);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: SpacingType.x4.value,
                    right: SpacingType.x4.value,
                    bottom: SpacingType.x4.value,
                  ),
                  child: ButtonView(
                    width: ButtonWidth.infinity,
                    state: ButtonState.active,
                    label: 'Login Example',
                    onPressed: () {
                      Get.toNamed(Routes.loginPage);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
