

import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/crypto/price/cache/price_provider_cache.dart';
import 'package:cryptowatcherx/data/crypto/price/crypto_money_snapshot.dart';
import 'package:localstorage/localstorage.dart';

class LocalStoragePriceProviderCache implements PriceProviderCache {

  LocalStorage _localStorage = LocalStorage('prices.json');

  @override
  Future<CryptoMoneySnapshot?> getSnapshot(CryptoCurrency currency) async {
    CryptoMoneySnapshot? snapshot = await _localStorage.getItem(currency.code);
    return snapshot;
  }

  @override
  Future<void> putSnapshot(CryptoMoneySnapshot snapshot) {
    return _localStorage.setItem(snapshot.currency.code, snapshot);
  }

}