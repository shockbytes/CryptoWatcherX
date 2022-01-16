import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/in_memory_investment_repository.dart';
import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final InvestmentRepository _investmentRepository =
      InMemoryInvestmentRepository();

  BehaviorSubject<List<Investment>> _investmentSubject = BehaviorSubject();

  Stream<List<DevelopedInvestment>> get investments =>
      _investmentSubject.stream.map((investments) {
        return investments.map(
          (investment) {
            // TODO Load real prices here
            return DevelopedInvestment(
              investment,
              Money(
                14.00,
                FiatCurrency.eur,
              ),
            );
          },
        ).toList();
      });

  HomeBloc() {
    _investmentSubject
        .addStream(_investmentRepository.getInvestments().asStream());
  }
}
