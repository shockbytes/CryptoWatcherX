import 'package:cryptowatcherx/data/core/money.dart';
import 'package:rxdart/rxdart.dart';

import 'balance.dart';

class BalanceBloc {
  BehaviorSubject<Balance> _balanceSubject = BehaviorSubject();

  Stream<Balance> get balance => _balanceSubject.stream;

  BalanceBloc() {
    _balanceSubject.add(
      Balance(
        invested: Money(
          242.75,
          FiatCurrency.eur,
        ),
        current: Money(
          744.23,
          FiatCurrency.eur,
        ),
      ),
    );
  }
}
