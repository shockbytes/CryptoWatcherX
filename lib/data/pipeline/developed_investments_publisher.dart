import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:rxdart/rxdart.dart';

class DevelopedInvestmentsPublisher {
  static BehaviorSubject<List<DevelopedInvestment>> _subject =
      BehaviorSubject();

  DevelopedInvestmentsPublisher._();

  static Stream<Money> onNew() => _subject.stream.map(
        (investments) {
          if (investments.isEmpty) {
            return Money.empty();
          }

          FiatCurrency currency = investments[0].currentPrice.currency;
          double sum = investments.fold(
            0,
            (sum, investment) => sum + investment.currentPrice.amount,
          );

          return Money(
            amount: sum,
            currency: currency,
          );
        },
      );

  static enqueue(List<DevelopedInvestment> investments) {
    _subject.add(investments);
  }
}
