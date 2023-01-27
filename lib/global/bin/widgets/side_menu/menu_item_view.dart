import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';

import '../../data/view_type.dart';
import '../../themes/our_colors.dart';
import '../text/text_view.dart';

class MenuItemView extends StatelessWidget {
  MenuItemView({
    required this.onTap,
    required this.text,
    required this.active,
    this.alignment = Alignment.centerLeft,
    this.useShadow = true,
    this.useLine = true,
    this.icon,
    super.key,
  });

  final bool active;
  final String text;
  final Alignment alignment;
  final bool useShadow;
  final bool useLine;
  final Widget? icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = RadiusType.subLarge.getBorderRadius();
    var bgColor = ComponentColors.background.sideMenuItemDefault;
    var textColor = ComponentColors.text.textGray1;
    var shadowColor = Colors.transparent;
    final line = <Widget>[];
    Widget mIcon = Container();
    if (active) {
      bgColor = ComponentColors.background.sideMenuItemActive;
      textColor = ComponentColors.text.textTertiary1;
      if (useShadow) {
        shadowColor = Colors.black.withOpacity(0.13);
      }
      if (useLine) {
        line.add(Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 20,
            width: 4,
            decoration: BoxDecoration(
              color: textColor,
              borderRadius: borderRadius,
            ),
          ),
        ));
      }
    }

    if (icon != null) {
      mIcon = AdaptiveLayout(
        largeLayout: Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.only(right: SpacingType.x2.value),
          child: icon!,
        ),
        mediumLayout: SizedBox(
          width: 30,
          height: 30,
          child: icon!,
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SpacingType.x2.value,
        vertical: SpacingType.x1.value,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: useShadow ? 2 : 0,
          shadowColor: shadowColor,
          side: const BorderSide(color: Colors.transparent, width: 0),
          backgroundColor: bgColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: onTap,
        child: SizedBox(
          height: 48,
          child: Stack(
            children: [
              ...line,
              Align(
                alignment: alignment,
                child: AdaptiveLayout(
                  largeLayout: Padding(
                    padding: EdgeInsets.only(
                      left: SpacingType.x3.value,
                      right: SpacingType.x3.value,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        mIcon,
                        TextView(
                          text,
                          type: TypographyType.labelLarge,
                          color: textColor,
                        ),
                      ],
                    ),
                  ),
                  mediumLayout: Center(
                    child: mIcon,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
