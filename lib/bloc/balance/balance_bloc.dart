import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:cryptowatcherx/data/pipeline/developed_investments_publisher.dart';
import 'package:rxdart/rxdart.dart';

import 'balance.dart';

class BalanceBloc {
  final InvestmentRepository _investmentRepository;

  BehaviorSubject<Balance> _balanceSubject = BehaviorSubject();

  Stream<Balance> get balance => _balanceSubject.stream;

  BalanceBloc(this._investmentRepository);

  fetch() {
    Rx.combineLatest2(
      _investmentRepository.getInvestedMoney(),
      DevelopedInvestmentsPublisher.onNew(),
      (Money investedMoney, Money developedMoney) {
        return Balance(
          invested: investedMoney,
          current: developedMoney,
        );
      },
    ).listen(
      (Balance balance) {
        _balanceSubject.add(balance);
      },
    );
  }
}
