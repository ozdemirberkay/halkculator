import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:halkculator/features/share_calculate/share_calculate_page.dart';

class ProfitCalculator {
  CalculationType calculationType;
  int calculateCount;
  int lot;
  double price;

  ProfitCalculator(
      {required this.calculationType,
      required this.calculateCount,
      required this.lot,
      required this.price});

  String protifPercent() {
    double result = _calculateNetProtiftOrLossPercentage();

    return tr(
      "profitPercent",
      namedArgs: {
        "value": result.toStringAsFixed(2),
      },
    );
  }

  String ceilingCount() {
    return (calculationType == CalculationType.profit)
        ? tr("ceilingCount", namedArgs: {"index": calculateCount.toString()})
        : tr("floorCount", namedArgs: {"index": calculateCount.toString()});
  }

  String sharePrice() {
    num result;
    if (calculationType == CalculationType.profit) {
      result = (price * _calculateProtiftPercentage());
    } else {
      result = (price * _calculateLossPercentage());
    }
    return tr("sharePrice", namedArgs: {"price": result.toStringAsFixed(2)});
  }

  String totalShareValue() {
    double result;
    if (calculationType == CalculationType.profit) {
      result = (price * _calculateProtiftPercentage() * lot);
    } else {
      result = (price * _calculateLossPercentage() * lot);
    }
    return tr("totalShareValue",
        namedArgs: {"value": result.toStringAsFixed(2)});
  }

  String totalProfitValue() {
    var percentage =
        (price * _calculateNetProtiftOrLossPercentage() * lot) / 100;
    var result = percentage.abs().toStringAsFixed(2);

    String sign = percentage >= 0 ? "+" : "-";

    return tr(
      "totalProfit",
      namedArgs: {
        "sign": sign,
        "value": result,
        "currency": "TL",
      },
    );
  }

  num _calculateProtiftPercentage() {
    return pow(1.1, calculateCount);
  }

  num _calculateLossPercentage() {
    return pow(0.9, calculateCount);
  }

  double _calculateNetProtiftOrLossPercentage() {
    num percentage = calculationType == CalculationType.profit
        ? _calculateProtiftPercentage()
        : _calculateLossPercentage();

    double fixedPercentage = double.parse(percentage.toStringAsFixed(4));

    return double.parse((((fixedPercentage - 1) * 100).toString()));
  }
}
