import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/crypto/price/api/coinmarketcap_api.dart';
import 'package:cryptowatcherx/data/crypto/price/crypto_money_snapshot.dart';
import 'package:cryptowatcherx/data/crypto/price/price_provider.dart';
import 'package:cryptowatcherx/data/crypto/price/price_source.dart';

class CoinmarketCapPriceProvider implements PriceProvider {

  CoinmarketCapApi _api;

  CoinmarketCapPriceProvider(this._api);

  @override
  Future<List<CryptoMoneySnapshot>> getCurrentPrices(
      List<CryptoCurrency> cryptoCurrencies,
  ) {

    // TODO Check for caches

    // TODO Hit Api
    return _api.getPrices(cryptoCurrencies);
  }

  @override
  PriceSource get priceSource => PriceSource(
        name: 'CoinmarketCap',
        icon: 'https://seeklogo.com/images/C/coinmarketcap-logo-064D167A0E-seeklogo.com.png',
      );
}
