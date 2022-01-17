import 'package:cryptowatcherx/data/core/money.dart';

import '../conversion.dart';

abstract class FiatApi {
  Future<Conversion> getCurrencyConversionRates(
    FiatCurrency source,
    FiatCurrency target,
  );
}
