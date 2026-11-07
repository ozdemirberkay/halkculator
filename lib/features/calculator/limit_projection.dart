import 'dart:math' as math;

import 'package:halkculator/core/data/stock_position.dart';

/// Borsa İstanbul's daily price limit (±10%).
const double dailyPriceLimit = 0.10;

/// How many consecutive limit days the calculator lists.
const int projectedDayCount = 50;

/// Direction of consecutive daily limit moves.
enum LimitDirection {
  /// Tavan: the price closes at the upper limit every day.
  ceiling(1 + dailyPriceLimit),

  /// Taban: the price closes at the lower limit every day.
  floor(1 - dailyPriceLimit);

  const LimitDirection(this.dailyFactor);

  /// Price multiplier applied for each limit day.
  final double dailyFactor;
}

/// The value of a [StockPosition] after [day] consecutive limit moves.
class LimitProjection {
  factory LimitProjection.calculate({
    required StockPosition position,
    required LimitDirection direction,
    required int day,
  }) {
    final factor = math.pow(direction.dailyFactor, day).toDouble();
    final price = position.price * factor;

    return LimitProjection._(
      day: day,
      direction: direction,
      price: price,
      totalValue: price * position.quantity,
      changePercent: (factor - 1) * 100,
      profit: (price - position.price) * position.quantity,
    );
  }

  const LimitProjection._({
    required this.day,
    required this.direction,
    required this.price,
    required this.totalValue,
    required this.changePercent,
    required this.profit,
  });

  final int day;
  final LimitDirection direction;

  /// Price per share after [day] limit moves.
  final double price;

  /// Value of the whole position at [price].
  final double totalValue;

  /// Change from the purchase price, in percent (negative for a loss).
  final double changePercent;

  /// Profit (positive) or loss (negative) of the whole position.
  final double profit;
}
