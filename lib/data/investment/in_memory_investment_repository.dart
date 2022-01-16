import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';
import 'package:rxdart/rxdart.dart';

import 'investment_repository.dart';

@deprecated
class InMemoryInvestmentRepository implements InvestmentRepository {
  final List<Investment> _investments = [
    Investment(
      currency: CryptoCurrency.btc,
      buyingPrice: Money(
        amount: 12.0,
        currency: FiatCurrency.eur,
      ),
      buyingTime: DateTime.now(),
      amount: 12,
    ),
    Investment(
      currency: CryptoCurrency.eth,
      buyingPrice: Money(
        amount: 12.0,
        currency: FiatCurrency.eur,
      ),
      buyingTime: DateTime.now(),
      amount: 2,
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
  Stream<Money> getInvestedMoney() {
    if (_investments.isEmpty) {
      return Future.value(Money.empty()).asStream();
    }

    FiatCurrency currency = _investments[0].buyingPrice.currency;
    double sum = _investments.fold(
      0,
      (sum, investment) => sum + investment.buyingPrice.amount,
    );

    return Future.value(
      Money(
        amount: sum,
        currency: currency,
      ),
    ).asStream();
  }
}
