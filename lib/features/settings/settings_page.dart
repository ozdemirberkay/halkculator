import 'package:flutter/material.dart';
import 'package:halkculator/core/data/saved_positions_repository.dart';
import 'package:halkculator/core/theme/app_sizes.dart';
import 'package:halkculator/core/theme/theme_controller.dart';
import 'package:halkculator/features/settings/widgets/clear_saved_card.dart';
import 'package:halkculator/features/settings/widgets/theme_mode_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
    required this.themeController,
    required this.savedPositions,
  });

  final ThemeController themeController;
  final SavedPositionsRepository savedPositions;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSizes.spacingMedium),
      children: [
        ThemeModeCard(controller: themeController),
        const SizedBox(height: AppSizes.spacingMedium),
        ClearSavedCard(savedPositions: savedPositions),
      ],
    );
  }
}
