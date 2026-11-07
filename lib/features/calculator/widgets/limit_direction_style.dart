import 'package:flutter/material.dart';
import 'package:halkculator/core/theme/app_colors.dart';
import 'package:halkculator/features/calculator/limit_projection.dart';
import 'package:halkculator/l10n/app_localizations.dart';

extension LimitDirectionStyle on LimitDirection {
  Color get color => switch (this) {
    LimitDirection.ceiling => AppColors.profit,
    LimitDirection.floor => AppColors.loss,
  };

  IconData get icon => switch (this) {
    LimitDirection.ceiling => Icons.add_circle_outline,
    LimitDirection.floor => Icons.remove_circle_outline,
  };

  String label(AppLocalizations l10n) => switch (this) {
    LimitDirection.ceiling => l10n.ceilingTab,
    LimitDirection.floor => l10n.floorTab,
  };

  String dayLabel(AppLocalizations l10n, int day) => switch (this) {
    LimitDirection.ceiling => l10n.ceilingDay(day),
    LimitDirection.floor => l10n.floorDay(day),
  };
}
