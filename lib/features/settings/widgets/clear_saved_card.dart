import 'package:flutter/material.dart';
import 'package:halkculator/core/data/saved_positions_repository.dart';
import 'package:halkculator/core/theme/app_sizes.dart';
import 'package:halkculator/core/widgets/app_card.dart';
import 'package:halkculator/l10n/app_localizations.dart';

class ClearSavedCard extends StatelessWidget {
  const ClearSavedCard({super.key, required this.savedPositions});

  final SavedPositionsRepository savedPositions;

  Future<void> _confirmAndClear(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.clearSavedTitle),
        content: Text(l10n.clearSavedConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancelButton),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.clearButton),
          ),
        ],
      ),
    );
    if (confirmed ?? false) await savedPositions.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.clearSavedTitle),
          const SizedBox(height: AppSizes.spacingSmall),
          ValueListenableBuilder(
            valueListenable: savedPositions.changes,
            builder: (context, _, _) => ElevatedButton(
              onPressed: savedPositions.isEmpty
                  ? null
                  : () => _confirmAndClear(context),
              child: Text(l10n.clearButton),
            ),
          ),
        ],
      ),
    );
  }
}
