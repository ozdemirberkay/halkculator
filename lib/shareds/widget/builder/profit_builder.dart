import 'package:flutter/material.dart';
import 'package:halkculator/features/share_calculate/share_calculate_page.dart';
import 'package:halkculator/features/share_calculate/share_manager.dart';
import 'package:halkculator/features/share_calculate/share_model.dart';
import 'package:halkculator/shareds/ad/ads_manager.dart';
import 'package:halkculator/shareds/calculator/profit_calculator.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:halkculator/shareds/widget/animation/empty_animation.dart';
import 'package:halkculator/shareds/widget/card/profit_card.dart';

class ProfitBuilder extends StatelessWidget {
  final CalculationType calculationType;
  const ProfitBuilder({super.key, required this.calculationType});

  @override
  Widget build(BuildContext context) {
    Share share = ShareCalculateManager.watchShare(context: context);

    if (share.lot <= 0 || share.price <= 0) {
      return const EmptyAnimation();
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: AppConstants.profitCalculateCount + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return BannerAdManager.instance.loadAndShowAd();
        }
        ProfitCalculator profitCalculator = ProfitCalculator(
            calculationType: calculationType,
            calculateCount: index,
            lot: share.lot,
            price: share.price);

        return Padding(
          padding: EdgeInsets.only(bottom: AppConstants.lowMargin),
          child: ProfitCard(profitCalculator: profitCalculator),
        );
      },
    );
  }
}
