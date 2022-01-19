import 'package:cryptowatcherx/data/core/money.dart';

import '../conversion.dart';
import '../conversion_source.dart';

abstract class FiatApi {

  ConversionSource get conversionSource;

  Future<Conversion> getCurrencyConversionRates(
    FiatCurrency source,
    FiatCurrency target,
  );
}
