import 'dart:async';

import 'package:clovis_two/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../data/view_type.dart';
import '../../themes/our_colors.dart';
import '../button/button_view.dart';
import '../text/text_view.dart';

class Dialogue {
  factory Dialogue() => _instance;

  Dialogue._internal();

  static final Dialogue _instance = Dialogue._internal();

  final _titlePadding = EdgeInsets.only(
    top: SpacingType.x4.value,
    left: SpacingType.x4.value,
    right: SpacingType.x4.value,
    bottom: SpacingType.x2.value,
  );

  final _contentPadding = EdgeInsets.only(
    top: SpacingType.x2.value,
    left: SpacingType.x4.value,
    right: SpacingType.x4.value,
    bottom: SpacingType.x8.value,
  );

  // region Message & Confirmation Dialog
  void showMessage(
    BuildContext context,
    String title,
    String message,
    String buttonLabel,
    Function() listener,
  ) {
    final button = ButtonView(
      label: buttonLabel,
      onPressed: () {
        listener();
        Navigator.of(context).pop();
      },
      width: ButtonWidth.w140,
      state: ButtonState.active,
    );

    final actions = Row(
      children: [
        Expanded(child: Container()),
        button,
      ],
    );

    final alert = AlertDialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: RadiusType.subLarge.getBorderRadius(),
      ),
      titlePadding: _titlePadding,
      contentPadding: _contentPadding,
      title: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextView(
              title,
              type: TypographyType.titleSmall,
            ),
          ),
          Divider(
            color: ComponentColors.button.tertiary,
            thickness: 0.8,
          ),
        ],
      ),
      content: SizedBox(
        width: 500,
        child: TextView(
          message,
          type: TypographyType.bodyModerate,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [actions],
    );

    showDialog(
      context: context,
      builder: (context) => alert,
      barrierDismissible: false,
    );
  }

  void showConfirmation(
    BuildContext context,
    String title,
    String message,
    String positiveLabel,
    String negativeLabel,
    Function(bool confirmed) listener,
  ) {
    final positive = ButtonView(
      label: positiveLabel,
      onPressed: () {
        Navigator.of(context).pop();
        listener(true);
      },
      width: ButtonWidth.w140,
      state: ButtonState.active,
    );

    final negative = ButtonView(
      label: negativeLabel,
      onPressed: () {
        Navigator.of(context).pop();
        listener(false);
      },
      width: ButtonWidth.w140,
      state: ButtonState.active,
      type: ButtonType.tertiary,
    );

    final actions = Row(
      children: [
        Expanded(child: Container()),
        negative,
        SizedBox(width: SpacingType.x2.value,),
        positive
      ],
    );

    final alert = AlertDialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: RadiusType.subLarge.getBorderRadius(),
      ),
      titlePadding: _titlePadding,
      contentPadding: _contentPadding,
      title: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextView(
              title,
              type: TypographyType.titleSmall,
            ),
          ),
          Divider(
            color: ComponentColors.button.tertiary,
            thickness: 0.8,
          ),
        ],
      ),
      content: SizedBox(
        width: 500,
        child: TextView(
          message,
          type: TypographyType.bodyModerate,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [actions],
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => alert,
    );
  }

  // endregion

  // region Loading Dialog
  final loadingDialogShown = false.obs;

  void hideLoading(BuildContext context) {
    if (loadingDialogShown.value) {
      loadingDialogShown.value = false;
      Navigator.of(context).pop();
    }
  }

  void showLoading(
    BuildContext context,
    String message,
    int maxTimeSecond,
  ) {
    if (loadingDialogShown.isTrue) {
      return;
    }
    const height = 50.0;
    final alert = AlertDialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: RadiusType.subLarge.getBorderRadius(),
      ),
      contentPadding: const EdgeInsets.all(12),
      content: SizedBox(
        width: 300,
        height: height,
        child: Row(
          children: [
            SizedBox(
              width: height,
              height: height,
              child: Lottie.asset(
                Assets.loader.loading1,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Center(
                child: TextView(
                  message,
                  type: TypographyType.bodyModerate,
                ),
              ),
            ),
            const SizedBox(
              width: height,
              height: height,
            ),
          ],
        ),
      ),
    );

    if (maxTimeSecond > 0 && maxTimeSecond < (3 * 60)) {
      Timer(Duration(seconds: maxTimeSecond), () {
        hideLoading(context);
      });
    }

    loadingDialogShown.value = true;
    showDialog(
      context: context,
      builder: (context) => alert,
      barrierDismissible: false,
    );
  }

  // endregion

  // region Blocker Dialog
  void showBlocker(
    BuildContext context,
    ImageProvider? image,
    String title,
    String message,
    String positiveLabel,
    String? negativeLabel,
    Function(bool positive) listener,
  ) {
    final positive = ButtonView(
      label: positiveLabel,
      onPressed: () {
        listener(true);
        Navigator.of(context).pop();
      },
      width: ButtonWidth.infinity,
      state: ButtonState.active,
    );

    final negative = ButtonView(
      label: negativeLabel ?? '',
      onPressed: () {
        listener(false);
        Navigator.of(context).pop();
      },
      width: ButtonWidth.infinity,
      state: ButtonState.active,
      type: ButtonType.tertiary,
    );

    var actions = Row(
      children: [
        Expanded(child: Container()),
        Expanded(flex: 2, child: positive),
        Expanded(child: Container()),
      ],
    );

    if (negativeLabel != null) {
      actions = Row(
        children: [
          Expanded(child: negative),
          SizedBox(width: SpacingType.x2.value,),
          Expanded(child: positive)
        ],
      );
    }

    final alert = AlertDialog(
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: RadiusType.subLarge.getBorderRadius(),
      ),
      titlePadding: _titlePadding,
      contentPadding: _contentPadding,
      title: (image != null)
          ? Image(
              image: image,
              height: 160,
              width: 160,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.medium,
            )
          : const SizedBox(
              height: 12,
            ),
      content: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextView(
              title,
              type: TypographyType.titleSmall,
            ),
            SizedBox(width: SpacingType.x2.value,),
            TextView(
              message,
              type: TypographyType.bodyModerate,
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [actions],
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => alert,
    );
  }
// endregion
}
