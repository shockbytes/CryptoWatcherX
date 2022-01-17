
import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';

import './price_source.dart';

abstract class PriceProvider {

  PriceSource get priceSource;

  Future<Money> getCurrentPrice(CryptoCurrency cryptoCurrency);
}