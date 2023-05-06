import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import './models/lotie_animation.dart';

class LotieAnimationView extends StatelessWidget {
  final LotieAnimation animation;
  final bool repeat;
  final bool reverse;

  const LotieAnimationView({
    super.key,
    required this.animation,
    this.repeat = true,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) => Lottie.asset(
        animation.fullPath,
        repeat: repeat,
        reverse: reverse,
      );
}

extension GetFullPath on LotieAnimation {
  String get fullPath => 'assets/animations/$name.json';
}

