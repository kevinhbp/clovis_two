import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import '../../global/bin/data/input_type.dart';
import '../../global/bin/widgets/button/button_view.dart';
import '../../global/bin/widgets/input/edit_text.dart';
import '../../global/bin/widgets/toast/toasty.dart';

class LoginPageController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = EditTextController(AppInputType.emailInputType);
  final passwordController =
      EditTextController(AppInputType.simplePasswordInputType);
  final submitButtonState = (ButtonState.inactive).obs;

  String email = '';
  String password = '';

  int mode = 0;

  final dbc = Debouncer(delay: const Duration(milliseconds: 500));

  // --
  @override
  void onInit() {
    super.onInit();
    emailController.onSaved = (text) {
      email = text ?? '';
    };
    passwordController.onSaved = (text) {
      password = text ?? '';
    };
  }

  void checkFormState() {
    formKey.currentState?.save();
    if (isValidLoginInput()) {
      submitButtonState.value = ButtonState.active;
    } else {
      submitButtonState.value = ButtonState.inactive;
    }
  }

  bool isValidLoginInput() {
    final validEmail = AppRegex.emailRegex.hasMatch(email);
    final validPassword = AppRegex.simplePasswordRegex.hasMatch(password);
    return validEmail && validPassword;
  }

  // --
  void onSubmitButtonLogin() {
    submitButtonState.value = ButtonState.loading;
    final isValidForm = formKey.currentState?.validate() ?? false;
    if (!isValidForm) {
      submitButtonState.value = ButtonState.inactive;
      return;
    }
    formKey.currentState?.save();

    // todo : call login api..
    dbc.call(() {
      if (mode == 0) { // if error -> show toast
        mode = 1;
        Toasty().showToastError('Invalid login request,\n'
            'username or password are invalid.');
        submitButtonState.value = ButtonState.active;
      } else { // if success -> go to dashboard
        mode = 0;
        Toasty().showToastSuccess('Login succeed\n'
            'Please wait, redirecting to Dashboard.');
        submitButtonState.value = ButtonState.active;
      }
    });
  }
}
