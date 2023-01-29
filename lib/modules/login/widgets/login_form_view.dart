import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/bin/widgets/button/button_view.dart';
import '../../../global/bin/widgets/input/edit_text.dart';
import '../../../global/bin/widgets/text/text_view.dart';
import '../../../global/strings/strings.dart';
import '../login_page_controller.dart';

class LoginFormView extends StatelessWidget {
  LoginFormView({super.key});

  final LoginPageController controller = Get.find();

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: SpacingType.x6.value,
          vertical: SpacingType.x4.value,
        ),
        decoration: BoxDecoration(
          color: ComponentColors.background.inputBox,
          borderRadius: RadiusType.subLarge.getBorderRadius(),
        ),
        padding: EdgeInsets.symmetric(
          vertical: SpacingType.x2.value,
          horizontal: SpacingType.x5.value,
        ),
        alignment: Alignment.topCenter,
        child: Form(
          key: controller.formKey,
          onChanged: controller.checkFormState,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  top: SpacingType.x6.value,
                  bottom: SpacingType.x6.value,
                ),
                child: TextView(
                  Strings.login,
                  type: TypographyType.titleModerate,
                ),
              ),
              EditText(
                tag: 'email',
                controller: controller.emailController,
                label: Strings.email,
                margin: EdgeInsets.only(
                  bottom: SpacingType.x2.value,
                ),
              ),
              EditText(
                tag: 'password',
                controller: controller.passwordController,
                label: Strings.password,
                margin: EdgeInsets.only(
                  bottom: SpacingType.x4.value,
                ),
              ),
              Expanded(child: Container()),
              Obx(
                () => ButtonView(
                  label: Strings.login,
                  width: ButtonWidth.w200,
                  state: controller.submitButtonState.value,
                  size: ButtonSize.large,
                  onPressed: () {
                    controller.onSubmitButtonLogin();
                  },
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      );
}
