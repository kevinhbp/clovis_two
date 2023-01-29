import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../global/bin/themes/our_colors.dart';
import '../../global/bin/widgets/toast/toasty.dart';
import 'login_page_controller.dart';
import 'widgets/login_form_view.dart';
import 'widgets/login_header_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Toasty().setBuildContext(context);
    return GetBuilder<LoginPageController>(
      builder: (controller) => Scaffold(
        backgroundColor: ComponentColors.background.cardDarker,
        body: Column(
          children: [
            Expanded(flex: 4, child: LoginHeaderView()),
            Expanded(flex: 6, child: LoginFormView()),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
