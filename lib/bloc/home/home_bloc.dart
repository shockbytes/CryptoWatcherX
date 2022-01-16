import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final InvestmentRepository _investmentRepository;

  BehaviorSubject<List<Investment>> _investmentSubject = BehaviorSubject();

  Stream<List<DevelopedInvestment>> get investments =>
      _investmentRepository.getInvestments().map((investments) {
        return investments.map(
          (investment) {
            // TODO Load real prices here
            return DevelopedInvestment(
              investment,
              Money(
                amount: 14.00,
                currency: FiatCurrency.eur,
              ),
            );
          },
        ).toList();
      });

  HomeBloc(this._investmentRepository);

  void fetch() {

//     _investmentRepository.getInvestments().listen((investments) => _investmentSubject.add(investments));
//     _investmentSubject.addStream(_investmentRepository.getInvestments());
  }
}
