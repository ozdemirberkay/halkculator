import 'package:flutter/material.dart';
import 'package:halkculator/core/theme/app_sizes.dart';

/// The tinted, outlined container used for every card in the app.
class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.1),
        border: Border.all(color: primary, width: AppSizes.borderWidth),
        borderRadius: AppSizes.borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spacingMedium),
        child: child,
      ),
    );
  }
}
