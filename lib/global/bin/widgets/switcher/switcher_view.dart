import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes/our_colors.dart';

enum SwitcherState {
  inactive(0),
  active(1),
  disabled(-1);

  const SwitcherState(this.id);

  final double id;
}

class SwitcherView extends StatelessWidget {
  const SwitcherView({
    required this.state,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final SwitcherState state;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final mThumbColor = (state == SwitcherState.active)
        ? ComponentColors.switcher.active
        : ComponentColors.switcher.inactive;
    return CupertinoSwitch(
      onChanged: (state != SwitcherState.disabled) ? onChanged : null,
      value: state == SwitcherState.active,
      activeColor: ComponentColors.switcher.track,
      thumbColor: mThumbColor,
      trackColor: ComponentColors.switcher.track,
    );
  }
}
