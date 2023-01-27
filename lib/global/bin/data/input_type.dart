import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'input_validator.dart';

class InputType {
  const InputType({
    required this.id,
    this.mask,
    this.validators,
    this.isSecret = false,
    this.isRequired = false,
    this.minLines,
    this.maxLines,
    this.maxCharacters,
    this.keyboardType = TextInputType.text,
  });

  final int id;
  final MaskTextInputFormatter? mask;
  final List<InputValidator>? validators;
  final bool isSecret;
  final int? minLines;
  final int? maxLines;
  final int? maxCharacters;
  final TextInputType? keyboardType;
  final bool isRequired;
}

mixin AppRegex {
  static RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  static RegExp phoneRegex =
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');
  static RegExp addressRegex = RegExp(r'^[\w\W]{0,150}$');
  static RegExp notEmptyRegex = RegExp(r'^[\w\W]{1,}$');
  static RegExp globalIdRegex = RegExp(r'^[\w\W]{1,8}$');
  static RegExp simplePasswordRegex = RegExp(r'^[\w\W]{8,}$');
  static RegExp shortDescRegex = RegExp(r'^[\w\W]{0,50}$');
  static RegExp fullDescRegex = RegExp(r'^[\w\W]{0,500}$');
}

mixin AppInputType {
  static const textInputType = InputType(
    id: 0,
  );

  static InputType emailInputType = InputType(
    id: 1,
    validators: [
      InputValidator(
        'email',
        'Invalid email format',
        AppRegex.emailRegex,
      ),
    ],
    keyboardType: TextInputType.emailAddress,
  );

  static InputType passwordInputType = InputType(
    id: 2,
    validators: [
      InputValidator(
        'password',
        'Invalid password format (min 8, at least 1 uppercase, 1 lowercase, 1'
            ' number and 1 special character).',
        AppRegex.passwordRegex,
      ),
    ],
    isSecret: true,
  );

  static InputType phoneInputType = InputType(
    id: 3,
    validators: [
      InputValidator(
        'phone',
        'Invalid phone format (at least 10 digits and maximum 12 digits).',
        AppRegex.phoneRegex,
      ),
    ],
    mask: MaskTextInputFormatter(
      mask: '###-###-######',
    ),
    keyboardType: TextInputType.phone,
  );

  static InputType addressInputType = InputType(
    id: 4,
    validators: [
      InputValidator(
        'address',
        'Maximum characters for address is 150.',
        AppRegex.addressRegex,
      ),
    ],
    keyboardType: TextInputType.multiline,
    maxLines: 4,
    minLines: 3,
    maxCharacters: 150,
  );

  static InputType regionInputType = InputType(
    id: 5,
    validators: [
      InputValidator(
        'region',
        'Select a region.',
        AppRegex.notEmptyRegex,
      ),
    ],
    isRequired: true,
  );

  static InputType globalIdInputType = InputType(
    id: 6,
    validators: [
      InputValidator(
        'globalid',
        'Global ID maximum alphanumeric characters is 8.',
        AppRegex.globalIdRegex,
      ),
    ],
    isRequired: true,
    maxCharacters: 8,
    keyboardType: TextInputType.text,
  );

  static InputType simplePasswordInputType = InputType(
    id: 7,
    validators: [
      InputValidator(
        'password',
        'Invalid password format (minimum 8 alphanumeric characters).',
        AppRegex.simplePasswordRegex,
      ),
    ],
    isRequired: true,
    isSecret: true,
  );

  static InputType domainInputType = InputType(id: 8,
    validators: [
      InputValidator(
        'domain',
        'Select a domain',
        AppRegex.notEmptyRegex,
      ),
    ],
    isRequired: true,
  );

  static InputType appNameInputType = InputType(id: 9,
    validators: [
      InputValidator(
        'appName',
        'Application name is required.',
        AppRegex.notEmptyRegex,
      ),
    ],
    isRequired: true,
  );

  static InputType shortDescInputType = InputType(id: 10,
    validators: [
      InputValidator(
        'shortDesc',
        'Maximum 50 characters.',
        AppRegex.shortDescRegex,
      ),
    ],
    keyboardType: TextInputType.text,
    isRequired: true,
    maxCharacters: 50,
  );

  static InputType fullDescInputType = InputType(id: 11,
    validators: [
      InputValidator(
        'fullDesc',
        'Maximum 500 characters.',
        AppRegex.fullDescRegex,
      ),
    ],
    keyboardType: TextInputType.multiline,
    isRequired: true,
    maxCharacters: 500,
    minLines: 3,
    maxLines: 5,
  );
}
