import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';

enum NavigationButtonState {
  unselected(0),
  selected(1),
  hover(2);

  const NavigationButtonState(this.mId);

  final double mId;
}

class NavigationButtonStyle {
  NavigationButtonStyle({
    required this.selectedTextStyle,
    required this.unselectedTextStyle,
    this.height = 52,
    this.width = double.infinity,
    this.iconSize = 24,
    this.unselectedBackgroundColor = Colors.transparent,
    this.selectedBackgroundColor = Colors.transparent,
    this.hoverBackgroundColor = Colors.transparent,
    this.unselectedIconColor = Colors.blueGrey,
    this.selectedIconColor = Colors.redAccent,
    this.hoverIconColor = Colors.grey,
  });

  double height;
  double width;
  double iconSize;

  Color unselectedBackgroundColor;
  Color selectedBackgroundColor;
  Color hoverBackgroundColor;

  Color unselectedIconColor;
  Color selectedIconColor;
  Color hoverIconColor;

  TextStyle selectedTextStyle;
  TextStyle unselectedTextStyle;
}

class NavigationButtonController extends GetxController {
  final state = NavigationButtonState.unselected.obs;
  final selected = false.obs;
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    required this.tag,
    required this.title,
    required this.onTap,
    required this.style,
    this.icon,
    this.svg,
    Key? key,
  }) : super(key: key);

  final String tag;
  final String title;
  final String? icon;
  final String? svg;
  final Function() onTap;
  final NavigationButtonStyle style;

  Color _getColor(NavigationButtonState state) {
    if (state == NavigationButtonState.hover) {
      return style.hoverBackgroundColor;
    }
    if (state == NavigationButtonState.selected) {
      return style.selectedBackgroundColor;
    }
    return style.unselectedBackgroundColor;
  }

  Widget _getIcon(NavigationButtonState state) {
    var iconColor = style.unselectedIconColor;
    if (state == NavigationButtonState.selected) {
      iconColor = style.selectedIconColor;
    } else if (state == NavigationButtonState.hover) {
      iconColor = style.hoverIconColor;
    }
    if (icon != null) {
      return AssetGenImage(icon!).image(
        width: style.iconSize,
        height: style.iconSize,
        color: iconColor,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.medium,
      );
    }
    if (svg != null) {
      return SvgGenImage(svg!).svg(
        width: style.iconSize,
        height: style.iconSize,
        color: iconColor,
      );
    }

    return SizedBox(
      width: style.iconSize,
      height: style.iconSize,
    );
  }

  TextStyle _getTextStyle(NavigationButtonState state) {
    if (state == NavigationButtonState.selected) {
      return style.selectedTextStyle;
    }
    return style.unselectedTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    final ourController = NavigationButtonController();
    Get.put(ourController, tag: tag);
    return GetBuilder<NavigationButtonController>(
      id: tag,
      init: ourController,
      tag: tag,
      builder: (controller) => InkWell(
        onTap: onTap,
        onHover: (value) {
          final selected = controller.selected.value;
          final nonHoverState = selected
              ? NavigationButtonState.selected
              : NavigationButtonState.unselected;
          controller.state.value =
              value ? NavigationButtonState.hover : nonHoverState;
        },
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Obx(() => Container(
                height: style.height,
                width: style.width,
                decoration: BoxDecoration(
                  color: _getColor(controller.state.value),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(
                    color: Colors.black12.withOpacity(0.1),
                    width: 1.6,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      _getIcon(controller.state.value),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: _getTextStyle(controller.state.value),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
