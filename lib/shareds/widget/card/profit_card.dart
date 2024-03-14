import 'package:flutter/material.dart';
import 'package:halkculator/features/share_calculate/share_calculate_page.dart';
import 'package:halkculator/shareds/calculator/profit_calculator.dart';
import 'package:halkculator/config/theme/app_colors.dart';
import 'package:halkculator/shareds/widget/layout/card_layout.dart';

class ProfitCard extends StatelessWidget {
  final ProfitCalculator profitCalculator;

  const ProfitCard({super.key, required this.profitCalculator});

  Color getColor() {
    return profitCalculator.calculationType == CalculationType.profit
        ? AppColors.profitColor
        : AppColors.lossColor;
  }

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profitCalculator.ceilingCount(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(profitCalculator.sharePrice())),
              Text(
                profitCalculator.protifPercent(),
                style: TextStyle(color: getColor()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  profitCalculator.totalShareValue(),
                ),
              ),
              Text(
                profitCalculator.totalProfitValue(),
                style: TextStyle(color: getColor()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
