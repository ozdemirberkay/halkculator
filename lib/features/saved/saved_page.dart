import 'package:flutter/material.dart';
import 'package:halkculator/core/data/saved_positions_repository.dart';
import 'package:halkculator/core/theme/app_sizes.dart';
import 'package:halkculator/core/widgets/empty_state.dart';
import 'package:halkculator/features/saved/widgets/saved_position_card.dart';
import 'package:halkculator/l10n/app_localizations.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key, required this.savedPositions});

  final SavedPositionsRepository savedPositions;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: savedPositions.changes,
      builder: (context, _, _) {
        final entries = savedPositions.newestFirst();
        if (entries.isEmpty) {
          return EmptyState(message: AppLocalizations.of(context).savedEmpty);
        }

        return ListView.separated(
          padding: const EdgeInsets.all(AppSizes.spacingSmall),
          itemCount: entries.length,
          separatorBuilder: (_, _) =>
              const SizedBox(height: AppSizes.spacingSmall),
          itemBuilder: (context, index) {
            final (:key, :position) = entries[index];
            return SavedPositionCard(
              key: ValueKey(key),
              position: position,
              onDelete: () => savedPositions.delete(key),
            );
          },
        );
      },
    );
  }
}
