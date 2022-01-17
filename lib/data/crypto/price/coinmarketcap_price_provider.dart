import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/crypto/price/api/coinmarketcap_api.dart';
import 'package:cryptowatcherx/data/crypto/price/cache/price_provider_cache.dart';
import 'package:cryptowatcherx/data/crypto/price/crypto_money_snapshot.dart';
import 'package:cryptowatcherx/data/crypto/price/price_provider.dart';
import 'package:cryptowatcherx/data/crypto/price/price_source.dart';

class CoinmarketCapPriceProvider implements PriceProvider {
  CoinmarketCapApi _api;
  PriceProviderCache _cache;

  CoinmarketCapPriceProvider(this._cache, this._api);

  @override
  PriceSource get priceSource => PriceSource(
        name: 'CoinmarketCap',
        icon:
            'https://seeklogo.com/images/C/coinmarketcap-logo-064D167A0E-seeklogo.com.png',
      );

  @override
  Future<List<CryptoMoneySnapshot>> getCurrentPrices(
    List<CryptoCurrency> cryptoCurrencies,
  ) {
    if (_hasCached(cryptoCurrencies)) {
      return _getCachedValues(cryptoCurrencies);
    }

    return _api.getPrices(cryptoCurrencies);
  }

  bool _hasCached(List<CryptoCurrency> cryptoCurrencies) {
    // TODO
    return false;
  }

  Future<List<CryptoMoneySnapshot>> _getCachedValues(
    List<CryptoCurrency> cryptoCurrencies,
  ) async {
    // TODO
    return [];
  }
}
