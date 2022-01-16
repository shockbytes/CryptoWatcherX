

import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';

class AddBloc {

  final InvestmentRepository _investmentRepository;

  AddBloc(this._investmentRepository);

  Future addInvestment(Investment investment) {
    return _investmentRepository.placeInvestment(investment);
  }

}