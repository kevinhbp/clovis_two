import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../data/input_type.dart';
import '../../data/input_validator.dart';
import '../../data/view_type.dart';
import '../../themes/our_colors.dart';
import '../../themes/our_edit_text_style.dart';
import '../../themes/our_text_style.dart';
import '../button/button_view.dart';
import '../text/text_view.dart';

enum EditTextStyle {
  normal(0),
  search(1);

  const EditTextStyle(this.value);

  final int? value;
}

class EditTextController extends GetxController {
  EditTextController(this.inputType);

  InputType inputType;
  Function(String? text)? onChanged;
  Function(String? text)? onSaved;

  TextInputType? keyboardType;
  List<InputValidator> inputValidators = [];
  List<TextInputFormatter> inputFormatters = [];
  TextEditingController textController = TextEditingController();

  final isObscure = false.obs;
  bool isSecret = false;
  bool isRequired = false;
  final isFocused = false.obs;
  final isFilled = false.obs;
  final isEnabled = true.obs;

  final initialValue = ''.obs;

  @override
  void onInit() {
    super.onInit();

    isObscure.value = inputType.isSecret;
    isSecret = inputType.isSecret;
    isRequired = inputType.isRequired;

    keyboardType = inputType.keyboardType;

    if (inputType.validators != null) {
      inputValidators.addAll(inputType.validators!);
    }
    if (inputType.mask != null) {
      inputFormatters.add(inputType.mask!);
    }
  }

  void onHasFocused() {
    isFocused.value = true;
  }

  void onLostFocused() {
    isFocused.value = false;
  }

  /// validating input text to validator returning error message.
  String? validator(String? text) {
    if (text == null || text.isEmpty) {
      if (isRequired) {
        return 'This field is required!';
      }
      return null;
    }

    if (inputValidators.isEmpty) {
      return null;
    }

    for (final item in inputValidators) {
      if (!item.isValidInput(text)) {
        return item.message;
      }
    }

    return null;
  }

  int minLines() => inputType.minLines ?? 1;

  int? maxLines() => isSecret ? 1 : inputType.maxLines;

  int? maxLength() => inputType.maxCharacters;

  Widget _actionButton() => ButtonView(
        margin: EdgeInsets.only(right: SpacingType.x1.value),
        type: ButtonType.callToAction,
        state: ButtonState.active,
        size: ButtonSize.small,
        label: isObscure.value ? 'Show' : 'Hide',
        onPressed: () {
          isObscure.value = !isObscure.value;
        },
      );

  Widget _clearActionButton() => ButtonView(
        margin: EdgeInsets.only(right: SpacingType.x1.value),
        type: ButtonType.callToAction,
        state: ButtonState.active,
        size: ButtonSize.small,
        label: 'Clear',
        onPressed: () {
          textController.clear();
          isFilled.value = false;
        },
      );

  Widget _searchPrefixIcon() => SizedBox(
        width: IconSize.small.size,
        height: IconSize.small.size,
        child: Assets.images.global.icActionSearch.svg(
          width: IconSize.small.size,
          height: IconSize.small.size,
        ),
      );

  Widget? suffixWidget(Widget? endWidget) {
    if (!isSecret) {
      return endWidget;
    }

    if (endWidget == null) {
      return Stack(
        alignment: Alignment.centerRight,
        children: [_actionButton()],
      );
    }

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _actionButton(),
            endWidget,
            const SizedBox(width: 7),
          ],
        )
      ],
    );
  }

  Widget? searchSuffixWidget(int hasFocus, Widget? endWidget) {
    if (hasFocus == 0) {
      if (endWidget != null) {
        return endWidget;
      }

      return null;
    }

    if (endWidget == null) {
      return Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _clearActionButton(),
              const SizedBox(width: 7),
            ],
          )
        ],
      );
    }

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _clearActionButton(),
            endWidget,
            const SizedBox(width: 7),
          ],
        )
      ],
    );
  }

  Widget? searchPrefixWidget(Widget? startWidget) {
    if (startWidget == null) {
      return Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 8,
              ),
              _searchPrefixIcon(),
            ],
          )
        ],
      );
    }

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 7,
            ),
            _searchPrefixIcon(),
            startWidget,
          ],
        )
      ],
    );
  }

  Widget? counterBuilder(
      BuildContext context, int currentLength, int? maxLength, bool isFocused) {
    if (inputType.keyboardType == TextInputType.multiline) {
      return TextView('$currentLength / $maxLength',
          type: TypographyType.labelSmall);
    }
    return null;
  }

  Widget topSpace(BuildContext context) {
    if (inputType.keyboardType == TextInputType.multiline) {
      return Container(
        height: SpacingType.x6.value,
      );
    }
    return Container();
  }
}

class EditText extends StatelessWidget {
  const EditText({
    required this.tag,
    required this.controller,
    required this.label,
    this.style = EditTextStyle.normal,
    this.hint = '',
    this.margin,
    this.startIcon,
    this.endIcon,
    super.key,
  });

  final EditTextController controller;
  final EditTextStyle style;
  final String label;
  final String hint;
  final String tag;

  final EdgeInsets? margin;
  final Widget? startIcon;
  final Widget? endIcon;

  @override
  Widget build(BuildContext context) {
    Get.put(controller, tag: tag);
    return Container(
      width: double.infinity,
      margin: margin,
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            controller.onHasFocused();
          } else {
            controller.onLostFocused();
          }
        },
        child: Obx(() => TextFormField(
          enabled: controller.isEnabled.value,
          decoration: style == EditTextStyle.normal
              ? OurEditTextTheme.ourInputDecoration.copyWith(
            labelText: label,
            hintText: hint,
            prefixIcon: startIcon,
            suffixIcon: controller.suffixWidget(endIcon),
          )
              : OurEditTextTheme.ourSearchInputDecoration.copyWith(
            labelText: label,
            hintText: hint,
            prefixIcon: controller.searchPrefixWidget(startIcon),
            suffixIcon: controller.searchSuffixWidget(
                controller.isFilled.value ? 1 : 0, endIcon),
          ),
          style: OurTextTheme.labelModerate,
          controller: controller.textController,
          inputFormatters: controller.inputFormatters,
          validator: controller.validator,
          keyboardType: controller.keyboardType,
          minLines: controller.minLines(),
          maxLines: controller.maxLines(),
          obscureText: controller.isObscure.value,
          maxLength: controller.maxLength(),
          buildCounter: (context,
              {required currentLength,
                required isFocused,
                maxLength}) =>
              controller.counterBuilder(
                  context, currentLength, maxLength, isFocused),
          onSaved: (value) {
            if (controller.onSaved != null) {
              controller.onSaved!(value);
            }
          },
          onChanged: (value) {
            if (value.isEmpty) {
              controller.isFilled.value = false;
            } else {
              controller.isFilled.value = true;
            }
            if (controller.onChanged != null) {
              controller.onChanged!(value);
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        )),
      ),
    );
  }
}
