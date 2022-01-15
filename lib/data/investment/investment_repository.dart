

import 'package:cryptowatcherx/data/investment/model/investment.dart';

abstract class InvestmentRepository {

  Future<List<Investment>> getInvestments();

  Future placeInvestment(Investment investment);
}