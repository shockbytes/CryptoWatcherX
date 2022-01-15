import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';

class Investment {
  final CryptoCurrency currency;
  final Money buyingPrice;
  final DateTime buyingTime;
  final double amount;

  Investment({
    required this.currency,
    required this.buyingPrice,
    required this.buyingTime,
    required this.amount,
  });
}
