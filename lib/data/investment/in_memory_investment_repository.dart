import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';
import 'package:rxdart/rxdart.dart';

import 'investment_repository.dart';

class InMemoryInvestmentRepository implements InvestmentRepository {
  final List<Investment> _investments = [
    Investment(
      currency: CryptoCurrency.btc,
      buyingPrice: Money(12.0, FiatCurrency.eur),
      buyingTime: DateTime.now(),
      amount: 12,
    ),
    Investment(
      currency: CryptoCurrency.eth,
      buyingPrice: Money(12.0, FiatCurrency.eur),
      buyingTime: DateTime.now(),
      amount: 12,
    ),
  ];

  BehaviorSubject<List<Investment>> _subject = BehaviorSubject();

  InMemoryInvestmentRepository() {
    _subject.add(_investments);
  }

  @override
  Stream<List<Investment>> getInvestments() {
    return _subject;
  }

  @override
  Future placeInvestment(Investment investment) async {
    _investments.add(investment);

    _subject.add(_investments);
  }

  @override
  Future<Money> getInvestedMoney() async {
    if (_investments.isEmpty) {
      return Money.empty();
    }

    FiatCurrency currency = _investments[0].buyingPrice.currency;
    double sum = _investments.fold(
      0,
      (sum, investment) => sum + investment.buyingPrice.amount,
    );

    return Money(sum, currency);
  }
}
