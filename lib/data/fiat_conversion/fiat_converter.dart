

import 'package:cryptowatcherx/data/core/money.dart';

import 'conversion.dart';

abstract class FiatConverter {

  Future<Conversion> prefetch(FiatCurrency source, FiatCurrency target);

  Future<Money> convert(Money money, FiatCurrency target);
}