import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/core/percentage.dart';

import 'investment.dart';

class DevelopedInvestment {
  final Investment investment;
  final Money currentPrice;
  final Percentage development;

  DevelopedInvestment(
    this.investment,
    this.currentPrice,
    this.development,
  );
}
