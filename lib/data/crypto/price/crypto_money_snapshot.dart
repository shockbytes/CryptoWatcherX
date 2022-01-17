import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';

class CryptoMoneySnapshot {
  final CryptoCurrency currency;
  final DateTime timestamp;
  final Money money;

  CryptoMoneySnapshot({
    required this.currency,
    required this.timestamp,
    required this.money,
  });
}
