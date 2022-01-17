import 'package:cryptowatcherx/data/core/crypto_currency.dart';

import './price_source.dart';
import 'crypto_money_snapshot.dart';

abstract class PriceProvider {
  PriceSource get priceSource;

  Future<List<CryptoMoneySnapshot>> getCurrentPrices(
    List<CryptoCurrency> cryptoCurrencies,
  );
}
