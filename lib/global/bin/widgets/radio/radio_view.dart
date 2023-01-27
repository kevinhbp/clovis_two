import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../data/view_type.dart';
import '../../themes/our_colors.dart';
import '../text/text_view.dart';

enum RadioState {
  inactive(0),
  active(1),
  disabled(-1);

  const RadioState(this.id);

  final double id;
}

class RadioView extends StatelessWidget {
  const RadioView({
    required this.state,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final RadioState state;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    const wrapperHeight = 32.0;
    const height = 24.0;

    var cbImage = Assets.images.global.icRadioDisabled.svg();
    if (state == RadioState.active) {
      cbImage = Assets.images.global.icRadioActive.svg();
    } else if (state == RadioState.inactive) {
      cbImage = Assets.images.global.icRadioInactive.svg();
    }

    var textColor = ComponentColors.text.textBlack1;
    if (state == RadioState.disabled) {
      textColor = ComponentColors.text.textGray3;
    }

    final content = SizedBox(
      height: wrapperHeight,
      child: Row(
        children: [
          Container(
            height: height,
            width: height,
            margin: EdgeInsets.symmetric(horizontal: SpacingType.x1.value),
            child: cbImage,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: SpacingType.x3.value,
              left: SpacingType.x1.value,
            ),
            child: TextView(
              label,
              type: TypographyType.labelModerate,
              color: textColor,
            ),
          ),
        ],
      ),
    );

    return InkWell(
      hoverColor: ComponentColors.checkbox.hover,
      highlightColor: ComponentColors.checkbox.highlight,
      splashColor: ComponentColors.checkbox.splash,
      onTap: (state == RadioState.disabled) ? null : onTap,
      borderRadius: RadiusType.circle.getBorderRadius(),
      child: content,
    );
  }
}
