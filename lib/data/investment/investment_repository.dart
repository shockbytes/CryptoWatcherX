

import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';

abstract class InvestmentRepository {

  Stream<List<Investment>> getInvestments();

  Stream<Money> getInvestedMoney();

  Future placeInvestment(Investment investment);
}