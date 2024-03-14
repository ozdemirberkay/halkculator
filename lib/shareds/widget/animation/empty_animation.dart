import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:lottie/lottie.dart';

class EmptyAnimation extends StatelessWidget {
  const EmptyAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(AppConstants.emptyAnimationPath);
  }
}
