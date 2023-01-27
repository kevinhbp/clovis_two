import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../gen/assets.gen.dart';
import '../../themes/our_colors.dart';
import '../../themes/our_text_style.dart';

enum ButtonSize {
  small(32),
  regular(36),
  large(40);

  const ButtonSize(this.value);

  final double? value;
}

enum ButtonWidth {
  wrap(null),
  w120(120),
  w140(140),
  w160(160),
  w200(200),
  infinity(double.infinity);

  const ButtonWidth(this.value);

  final double? value;
}

enum ButtonType {
  primary(0),
  secondary(1),
  tertiary(2),
  callToAction(3);

  const ButtonType(this.id);

  final double id;
}

enum ButtonState {
  active(0),
  inactive(1),
  loading(2),
  destructive(3),
  loadingDestructive(4);

  const ButtonState(this.id);

  final double id;
}

class ButtonView extends StatelessWidget {
  const ButtonView({
    required this.label,
    required this.onPressed,
    this.size = ButtonSize.regular,
    this.width = ButtonWidth.wrap,
    this.type = ButtonType.primary,
    this.state = ButtonState.inactive,
    this.iconLeft,
    this.iconRight,
    this.margin,
    this.padding = const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
    Key? key,
  }) : super(key: key);

  final ButtonSize size;
  final ButtonWidth width;
  final ButtonType type;
  final ButtonState state;

  final String label;
  final Function() onPressed;
  final Widget? iconLeft;
  final Widget? iconRight;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final textButton = ButtonTextView(
      label: label,
      type: type,
      state: state,
    );
    final content = ButtonContentView(
      size: size,
      state: state,
      leftIcon: iconLeft,
      rightIcon: iconRight,
      label: textButton,
    );
    Widget button = PrimaryButtonView(
      onPressed: onPressed,
      state: state,
      child: content,
    );
    if (type == ButtonType.secondary) {
      button = SecondaryButtonView(
        onPressed: onPressed,
        state: state,
        child: content,
      );
    } else if (type == ButtonType.tertiary) {
      button = TertiaryButtonView(
        onPressed: onPressed,
        state: state,
        child: content,
      );
    } else if (type == ButtonType.callToAction) {
      button = CallToActionButtonView(
        onPressed: onPressed,
        state: state,
        child: content,
      );
    }
    return Container(
      margin: margin,
      width: width.value,
      height: size.value,
      child: button,
    );
  }
}

// --
class ButtonTextView extends StatelessWidget {
  const ButtonTextView({
    required this.label,
    this.type = ButtonType.primary,
    this.state = ButtonState.inactive,
    Key? key,
  }) : super(key: key);

  final String label;
  final ButtonType type;
  final ButtonState state;

  @override
  Widget build(BuildContext context) {
    var textColor = Colors.white;
    if (type != ButtonType.primary && type != ButtonType.callToAction) {
      if (state == ButtonState.inactive) {
        textColor = Theme.of(context).disabledColor;
      } else if (state == ButtonState.destructive) {
        textColor = Theme.of(context).errorColor;
      } else {
        textColor = Theme.of(context).primaryColor;
      }
    }
    return Text(
      label,
      style: OurTextTheme.labelModerate.copyWith(
        color: textColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class ButtonContentView extends StatelessWidget {
  const ButtonContentView({
    required this.size,
    required this.state,
    required this.label,
    this.leftIcon,
    this.rightIcon,
    Key? key,
  }) : super(key: key);

  final ButtonSize size;
  final ButtonState state;
  final Widget label;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    if (state == ButtonState.loading) {
      return ButtonLoaderView(size: size);
    }
    if (state == ButtonState.loadingDestructive) {
      return ButtonLoaderView(size: size);
    }
    if (state == ButtonState.inactive) {
      return label;
    }
    if (leftIcon == null && rightIcon == null) {
      return label;
    }
    final widgets = <Widget>[];
    if (leftIcon != null) {
      widgets.add(leftIcon!);
    }
    widgets.add(label);
    if (rightIcon != null) {
      widgets.add(rightIcon!);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }
}

// --
class PrimaryButtonView extends StatelessWidget {
  const PrimaryButtonView({
    required this.onPressed,
    required this.state,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;
  final ButtonState state;

  @override
  Widget build(BuildContext context) {
    var primary = ComponentColors.button.primaryActive;
    if (state == ButtonState.inactive) {
      primary = ComponentColors.button.primaryInactive;
    } else if (state == ButtonState.destructive) {
      primary = ComponentColors.button.primaryDestructive;
    } else if (state == ButtonState.loadingDestructive) {
      primary = ComponentColors.button.primaryDestructive;
    }
    final onPrimary = ComponentColors.button.textOnPrimary;

    final isDisabled = state == ButtonState.inactive;
    final isLoading =
        state == ButtonState.loading || state == ButtonState.loadingDestructive;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        side: const BorderSide(color: Colors.transparent, width: 0),
        shadowColor: Colors.transparent,
        backgroundColor: primary,
        foregroundColor: onPrimary,
        disabledForegroundColor: Colors.black,
      ),
      onPressed: isDisabled
          ? null
          : () {
              if (!isLoading) {
                onPressed();
              }
            },
      child: child,
    );
  }
}

class SecondaryButtonView extends StatelessWidget {
  const SecondaryButtonView({
    required this.onPressed,
    required this.state,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;
  final ButtonState state;

  @override
  Widget build(BuildContext context) {
    var primary = ComponentColors.button.secondaryActive;
    var onPrimary = ComponentColors.button.primaryActive;
    if (state == ButtonState.inactive) {
      primary = ComponentColors.button.secondaryInactive;
      onPrimary = ComponentColors.button.primaryInactive;
    } else if (state == ButtonState.destructive) {
      primary = ComponentColors.button.secondaryDestructive;
      onPrimary = ComponentColors.button.primaryDestructive;
    } else if (state == ButtonState.loadingDestructive) {
      primary = ComponentColors.button.secondaryDestructive;
      onPrimary = ComponentColors.button.primaryDestructive;
    }

    final isDisabled = state == ButtonState.inactive;
    final isLoading =
        state == ButtonState.loading || state == ButtonState.loadingDestructive;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        side: const BorderSide(color: Colors.transparent, width: 0),
        shadowColor: Colors.transparent,
        backgroundColor: primary,
        foregroundColor: onPrimary,
        disabledForegroundColor: Colors.black,
      ),
      onPressed: isDisabled
          ? null
          : () {
              if (!isLoading) {
                onPressed();
              }
            },
      child: child,
    );
  }
}

class TertiaryButtonView extends StatelessWidget {
  const TertiaryButtonView({
    required this.onPressed,
    required this.state,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;
  final ButtonState state;

  @override
  Widget build(BuildContext context) {
    final primary = ComponentColors.button.tertiary;
    var onPrimary = ComponentColors.button.primaryActive;
    if (state == ButtonState.inactive) {
      onPrimary = ComponentColors.button.primaryInactive;
    } else if (state == ButtonState.destructive) {
      onPrimary = ComponentColors.button.primaryDestructive;
    } else if (state == ButtonState.loadingDestructive) {
      onPrimary = ComponentColors.button.primaryDestructive;
    }

    final isDisabled = state == ButtonState.inactive;
    final isLoading =
        state == ButtonState.loading || state == ButtonState.loadingDestructive;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        side: const BorderSide(color: Colors.transparent, width: 0),
        shadowColor: Colors.transparent,
        backgroundColor: primary,
        foregroundColor: onPrimary,
        disabledForegroundColor: Colors.black,
      ),
      onPressed: isDisabled
          ? null
          : () {
              if (!isLoading) {
                onPressed();
              }
            },
      child: child,
    );
  }
}

class CallToActionButtonView extends StatelessWidget {
  const CallToActionButtonView({
    required this.onPressed,
    required this.state,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;
  final ButtonState state;

  @override
  Widget build(BuildContext context) {
    final primary = ComponentColors.button.callToAction;
    final onPrimary = ComponentColors.button.textOnCallToAction;

    final isDisabled = state == ButtonState.inactive;
    final isLoading =
        state == ButtonState.loading || state == ButtonState.loadingDestructive;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        side: const BorderSide(color: Colors.transparent, width: 0),
        shadowColor: Colors.transparent,
        backgroundColor: primary,
        foregroundColor: onPrimary,
        disabledForegroundColor: Colors.black,
      ),
      onPressed: isDisabled
          ? null
          : () {
              if (!isLoading) {
                onPressed();
              }
            },
      child: child,
    );
  }
}

// --
class ButtonLoaderView extends StatelessWidget {
  const ButtonLoaderView({
    required this.size,
    Key? key,
  }) : super(key: key);

  final ButtonSize size;

  @override
  Widget build(BuildContext context) {
    var wh = 32.toDouble();
    if (size == ButtonSize.small) {
      wh = 26.toDouble();
    }
    return Container(
        width: wh * 1.5,
        height: wh,
        decoration: BoxDecoration(
          color: ComponentColors.button.tertiary,
          borderRadius: BorderRadius.all(Radius.circular(wh)),
        ),
        child: Lottie.asset(
          Assets.loader.loading1,
          width: wh,
          height: wh,
          fit: BoxFit.contain,
        ));
  }
}
