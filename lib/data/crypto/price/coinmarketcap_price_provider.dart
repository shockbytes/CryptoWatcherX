import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/crypto/price/price_provider.dart';
import 'package:cryptowatcherx/data/crypto/price/price_source.dart';

class CoinmarketCapPriceProvider implements PriceProvider {
  @override
  Future<Money> getCurrentPrice(CryptoCurrency cryptoCurrency) async {
    // TODO Implement
    return Money(
      amount: 14.0,
      currency: FiatCurrency.usd,
    );
  }

  @override
  PriceSource get priceSource => PriceSource(
        name: 'CoinmarketCap',
        icon: 'TODO',
      );
}
