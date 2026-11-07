import 'package:flutter/material.dart';
import 'package:halkculator/core/data/stock_position.dart';
import 'package:halkculator/core/widgets/app_card.dart';
import 'package:halkculator/l10n/app_localizations.dart';

class SavedPositionCard extends StatelessWidget {
  const SavedPositionCard({
    super.key,
    required this.position,
    required this.onDelete,
  });

  final StockPosition position;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.shareQuantity(position.quantity)),
                Text(l10n.sharePrice(position.price)),
              ],
            ),
          ),
          IconButton(
            tooltip: l10n.deleteTooltip,
            onPressed: onDelete,
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
