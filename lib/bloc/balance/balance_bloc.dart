import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'balance.dart';

class BalanceBloc {

  final InvestmentRepository _investmentRepository;

  BehaviorSubject<Balance> _balanceSubject = BehaviorSubject();

  Stream<Balance> get balance => _balanceSubject.stream;

  BalanceBloc(this._investmentRepository) {
    fetch();
  }

  Future fetch() async {

    Money invested = await _investmentRepository.getInvestedMoney();

    _balanceSubject.add(
      Balance(
        invested: invested,
        current: Money(
          744.23,
          FiatCurrency.eur,
        ),
      ),
    );
  }
}
