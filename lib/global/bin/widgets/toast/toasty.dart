import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../gen/assets.gen.dart';
import '../../data/view_type.dart';
import '../../themes/our_colors.dart';
import '../text/text_view.dart';

class Toasty {
  factory Toasty() => _instance;

  Toasty._internal();

  static final Toasty _instance = Toasty._internal();

  final fToast = FToast();

  final double horizontalPadding = 50;

  void setBuildContext(BuildContext context) {
    fToast.init(context);
  }

  // Default
  void showToast(String message) {
    // Default Toast
    final Widget content = Container(
      height: 46,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: RadiusType.large.getBorderRadius(),
        color: OurColors.neutral.c30,
      ),
      child: Center(
        child: TextView(
          message,
          type: TypographyType.labelModerate,
          color: ComponentColors.text.textWhite2,
        ),
      ),
    );

    fToast.showToast(
      child: content,
      gravity: ToastGravity.BOTTOM_RIGHT,
      toastDuration: const Duration(seconds: 3),
      fadeDuration: const Duration(milliseconds: 300),
    );

    /*Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM_RIGHT,
      timeInSecForIosWeb: 6,
      webBgColor: 'linear-gradient(to right, #374747, #374747)',
    );*/
  }

  // Error
  void showToastError(String message) {
    // Default Toast
    final Widget content = Container(
      height: 46,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: RadiusType.large.getBorderRadius(),
        color: OurColors.error.c50,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 8),
              child: Assets.images.global.icStatusError.svg(),
            ),
            TextView(
              message,
              type: TypographyType.labelModerate,
              color: ComponentColors.text.textWhite2,
            )
          ],
        ),
      ),
    );

    fToast.showToast(
      child: content,
      gravity: ToastGravity.BOTTOM_RIGHT,
      toastDuration: const Duration(seconds: 3),
      fadeDuration: const Duration(milliseconds: 300),
    );
  }

  // Success
  void showToastSuccess(String message) {
    // Default Toast
    final Widget content = Container(
      height: 46,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: RadiusType.large.getBorderRadius(),
        color: OurColors.primary.c50,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 8),
              child: Assets.images.global.icStatusSuccess.svg(),
            ),
            TextView(
              message,
              type: TypographyType.labelModerate,
              color: ComponentColors.text.textWhite2,
            )
          ],
        ),
      ),
    );

    fToast.showToast(
      child: content,
      gravity: ToastGravity.BOTTOM_RIGHT,
      toastDuration: const Duration(seconds: 3),
      fadeDuration: const Duration(milliseconds: 300),
    );
  }

  // Warning
  void showToastWarning(String message) {
    // Default Toast
    final Widget content = Container(
      height: 46,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: RadiusType.large.getBorderRadius(),
        color: OurColors.additional.yellowMaximum,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 8),
              child: Assets.images.global.icStatusWarning.svg(),
            ),
            TextView(
              message,
              type: TypographyType.labelModerate,
              color: ComponentColors.text.textWhite2,
            )
          ],
        ),
      ),
    );

    fToast.showToast(
      child: content,
      gravity: ToastGravity.BOTTOM_RIGHT,
      toastDuration: const Duration(seconds: 3),
      fadeDuration: const Duration(milliseconds: 300),
    );
  }

  // Information
  void showToastInformation(String message) {
    // Default Toast
    final Widget content = Container(
      height: 46,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: RadiusType.large.getBorderRadius(),
        color: OurColors.additional.blueDeFrench,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 8),
              child: Assets.images.global.icStatusInformation.svg(),
            ),
            TextView(
              message,
              type: TypographyType.labelModerate,
              color: ComponentColors.text.textWhite2,
            )
          ],
        ),
      ),
    );

    fToast.showToast(
      child: content,
      gravity: ToastGravity.BOTTOM_RIGHT,
      toastDuration: const Duration(seconds: 3),
      fadeDuration: const Duration(milliseconds: 300),
    );
  }
}
