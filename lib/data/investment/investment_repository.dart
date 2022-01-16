

import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';

abstract class InvestmentRepository {

  Future<List<Investment>> getInvestments();

  Future<Money> getInvestedMoney();

  Future placeInvestment(Investment investment);
}