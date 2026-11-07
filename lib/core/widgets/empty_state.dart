import 'package:flutter/material.dart';
import 'package:halkculator/core/constants/app_assets.dart';
import 'package:halkculator/core/theme/app_sizes.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final message = this.message;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: Lottie.asset(AppAssets.emptyAnimation)),
          if (message != null)
            Padding(
              padding: const EdgeInsets.all(AppSizes.spacingMedium),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
        ],
      ),
    );
  }
}
