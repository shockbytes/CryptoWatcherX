import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';

import 'investment_repository.dart';

class InMemoryInvestmentRepository implements InvestmentRepository {
  @override
  Future<List<Investment>> getInvestments() async {
    return [
      Investment(
        currency: CryptoCurrency(
          name: 'Bitcoin',
          code: 'BTC',
          icon: 'https://cryptoicons.org/api/color/btc/64/212121',
        ),
        buyingPrice: Money(12.0, FiatCurrency.eur),
        buyingTime: DateTime.now(),
        amount: 12,
      ),
      Investment(
        currency: CryptoCurrency(
          name: 'Ethereum',
          code: 'ETH',
          icon: 'https://cryptoicons.org/api/color/eth/64/212121',
        ),
        buyingPrice: Money(12.0, FiatCurrency.eur),
        buyingTime: DateTime.now(),
        amount: 12,
      ),
    ];
  }

  @override
  Future placeInvestment(Investment investment) {
    // TODO: implement placeInvestment
    throw UnimplementedError();
  }
}
