import 'package:flutter/material.dart';
import 'package:halkculator/core/widgets/app_card.dart';
import 'package:halkculator/features/calculator/limit_projection.dart';
import 'package:halkculator/features/calculator/widgets/limit_direction_style.dart';
import 'package:halkculator/l10n/app_localizations.dart';

class LimitProjectionCard extends StatelessWidget {
  const LimitProjectionCard({super.key, required this.projection});

  final LimitProjection projection;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final highlight = TextStyle(color: projection.direction.color);
    final sign = projection.profit < 0 ? '-' : '+';

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(projection.direction.dayLabel(l10n, projection.day)),
          Row(
            children: [
              Expanded(child: Text(l10n.sharePrice(projection.price))),
              Text(
                l10n.changePercent(sign, projection.changePercent.abs()),
                style: highlight,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text(l10n.totalValue(projection.totalValue))),
              Text(
                l10n.profitAmount(sign, projection.profit.abs()),
                style: highlight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
