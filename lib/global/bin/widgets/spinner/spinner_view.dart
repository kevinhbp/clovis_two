import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../data/input_type.dart';
import '../../data/input_validator.dart';
import '../../data/view_type.dart';
import '../../themes/our_colors.dart';
import '../../themes/our_edit_text_style.dart';
import '../../themes/our_text_style.dart';
import '../text/text_view.dart';

class SpinnerModel {
  SpinnerModel({required this.items, this.selected});

  List<String> items;
  String? selected;
}

class SpinnerController extends GetxController {
  SpinnerController(this.inputType);

  InputType inputType;
  Function(String? text)? onChanged;
  Function(String? text)? onSaved;

  final model = SpinnerModel(items: []).obs;
  final isEnabled = true.obs;

  List<InputValidator> inputValidators = [];
  bool isRequired = false;

  @override
  void onInit() {
    super.onInit();

    isRequired = inputType.isRequired;

    if (inputType.validators != null) {
      inputValidators.addAll(inputType.validators!);
    }
  }

  void setOptionsList(List<String> data, String? selected) {
    final mModel = SpinnerModel(items: data, selected: selected);
    model.value = mModel;
  }

  List<DropdownMenuItem<String>> getItems(List<String> items) => items
      .map((e) => DropdownMenuItem<String>(
            value: e,
            child: TextView(e, type: TypographyType.labelModerate),
          ))
      .toList();

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
}

class SpinnerView extends StatelessWidget {
  const SpinnerView({
    required this.tag,
    required this.controller,
    required this.label,
    this.hint = '',
    this.margin,
    this.startIcon,
    this.endIcon,
    super.key,
  });

  final SpinnerController controller;
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
      margin: margin,
      child: Obx(
        () => DropdownButtonFormField<String>(
          focusColor: Colors.transparent,
          items: controller.getItems(controller.model.value.items),
          value: controller.model.value.selected,
          decoration: OurEditTextTheme.ourInputDecoration.copyWith(
            labelText: label,
            hintText: hint,
            prefixIcon: startIcon,
            suffixIcon: endIcon,
          ),
          style: OurTextTheme.labelModerate,
          borderRadius: RadiusType.small.getBorderRadius(),
          onChanged: (value) {
            if (controller.onChanged != null) {
              controller.onChanged!(value);
            }
          },
          onSaved: (value) {
            if (controller.onSaved != null) {
              controller.onSaved!(value);
            }
          },
          icon: Assets.images.global.icActionDropdown.svg(
              width: IconSize.micro.size,
              color: ComponentColors.button.callToAction),
          validator: controller.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}
