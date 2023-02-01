import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../gen/assets.gen.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    this.height = 400,
    this.loading,
    super.key,
  });

  final double height;
  final String? loading;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    child: Center(
      child: Lottie.asset(
        loading ?? Assets.loader.loading1,
        width: 64,
        height: 64,
        fit: BoxFit.fill,
      ),
    ),
  );
}