import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'balance.dart';

class BalanceBloc {

  final InvestmentRepository _investmentRepository;

  BehaviorSubject<Balance> _balanceSubject = BehaviorSubject();

  Stream<Balance> get balance => _balanceSubject.stream;

  BalanceBloc(this._investmentRepository);

  fetch() {
    _investmentRepository.getInvestedMoney().then((invested) {
      _balanceSubject.add(
        Balance(
          invested: invested,
          current: Money(
            amount: 744.23,
            currency: FiatCurrency.eur,
          ),
        ),
      );
    });
  }
}
