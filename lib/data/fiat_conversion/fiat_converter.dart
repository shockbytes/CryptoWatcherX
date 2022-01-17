

import 'package:cryptowatcherx/data/core/money.dart';

abstract class FiatConverter {

  Future<Money> convert(Money money, FiatCurrency target);
}