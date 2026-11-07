import 'package:flutter/material.dart';
import 'package:halkculator/core/theme/app_sizes.dart';
import 'package:halkculator/core/theme/theme_controller.dart';
import 'package:halkculator/core/widgets/app_card.dart';
import 'package:halkculator/l10n/app_localizations.dart';

class ThemeModeCard extends StatelessWidget {
  const ThemeModeCard({super.key, required this.controller});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.themeTitle),
          const SizedBox(height: AppSizes.spacingSmall),
          ListenableBuilder(
            listenable: controller,
            builder: (context, _) => SegmentedButton<ThemeMode>(
              segments: [
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: const Icon(Icons.brightness_auto),
                  label: Text(l10n.themeSystem),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: const Icon(Icons.light_mode),
                  label: Text(l10n.themeLight),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: const Icon(Icons.dark_mode),
                  label: Text(l10n.themeDark),
                ),
              ],
              selected: {controller.mode},
              onSelectionChanged: (selection) =>
                  controller.setMode(selection.single),
            ),
          ),
        ],
      ),
    );
  }
}
