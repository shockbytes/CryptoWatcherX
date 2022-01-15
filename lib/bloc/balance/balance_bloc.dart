import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/core/percentage.dart';
import 'package:rxdart/rxdart.dart';

import 'balance.dart';

class BalanceBloc {
  BehaviorSubject<Balance> _balanceSubject = BehaviorSubject();

  Stream<Balance> get balance => _balanceSubject.stream;

  BalanceBloc() {
    _balanceSubject.add(
      Balance(
          initial: Money(
            242.75,
            FiatCurrency.eur,
          ),
          current: Money(
            744.23,
            FiatCurrency.eur,
          ),
          development: Percentage(206.58)),
    );
  }
}
