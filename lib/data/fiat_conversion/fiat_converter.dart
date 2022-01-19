

import 'package:cryptowatcherx/data/core/money.dart';

import 'conversion.dart';
import 'conversion_source.dart';

abstract class FiatConverter {

  ConversionSource get conversionSource;

  Future<Conversion> prefetch(FiatCurrency source, FiatCurrency target);

  Future<Money> convert(Money money, FiatCurrency target);
}