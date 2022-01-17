

import 'package:cryptowatcherx/data/core/crypto_currency.dart';

import '../crypto_money_snapshot.dart';

abstract class PriceProviderCache {

  Future<CryptoMoneySnapshot?> getSnapshot(CryptoCurrency currency);

  Future<void> putSnapshot(CryptoMoneySnapshot snapshot);

}