
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class LoginHeaderView extends StatelessWidget {
  LoginHeaderView({super.key});

  @override
  Widget build(BuildContext context) => Container(
    alignment: Alignment.center,
    child: Assets.images.illustration.illustrationEnvironmentRocket.image(
      width: 80,
      height: 80,
    ),
  );
}