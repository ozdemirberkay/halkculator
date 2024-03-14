import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:halkculator/config/theme/app_colors.dart';

class CardLayout extends StatelessWidget {
  final Widget child;
  const CardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: AppConstants.boxBorderWidth,
          color: AppColors.primaryColor,
        ),
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: AppConstants.borderRadius,
      ),
      padding: EdgeInsets.all(AppConstants.highMargin),
      child: child,
    );
  }
}
