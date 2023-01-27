import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../data/view_type.dart';
import '../../themes/our_colors.dart';
import '../text/text_view.dart';

enum CheckboxState {
  inactive(0),
  active(1),
  disabled(-1);

  const CheckboxState(this.id);

  final double id;
}

class CheckboxView extends StatelessWidget {
  const CheckboxView({
    required this.state,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final CheckboxState state;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    const wrapperHeight = 32.0;
    const height = 24.0;

    var cbImage = Assets.images.global.icCheckboxDisabled.svg();
    if (state == CheckboxState.active) {
      cbImage = Assets.images.global.icCheckboxActive.svg();
    } else if (state == CheckboxState.inactive) {
      cbImage = Assets.images.global.icCheckboxInactive.svg();
    }

    var textColor = ComponentColors.text.textBlack1;
    if (state == CheckboxState.disabled) {
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
      onTap: (state == CheckboxState.disabled) ? null : onTap,
      borderRadius: RadiusType.circle.getBorderRadius(),
      child: content,
    );
  }
}
