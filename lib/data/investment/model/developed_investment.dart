import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/core/percentage.dart';
import 'package:cryptowatcherx/util/math_util.dart';

import 'investment.dart';

class DevelopedInvestment {
  final Investment investment;
  final Money currentPrice;

  DevelopedInvestment({
    required this.investment,
    required this.currentPrice,
  });

  Percentage get development {
    return computePercentage(
      base: investment.buyingPrice.amount,
      now: currentPrice.amount,
    );
  }

  bool get isPositive => development.percentage >= 0;
}
