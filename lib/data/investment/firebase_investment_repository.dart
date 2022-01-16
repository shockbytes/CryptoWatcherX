

import 'package:cryptowatcherx/data/core/money.dart';

import 'package:cryptowatcherx/data/investment/model/investment.dart';

import 'investment_repository.dart';

/// TODO Coming soon
class FirebaseInvestmentRepository implements InvestmentRepository {
  @override
  Future<Money> getInvestedMoney() {
    // TODO: implement getInvestedMoney
    throw UnimplementedError();
  }

  @override
  Stream<List<Investment>> getInvestments() {
    // TODO: implement getInvestments
    throw UnimplementedError();
  }

  @override
  Future placeInvestment(Investment investment) {
    // TODO: implement placeInvestment
    throw UnimplementedError();
  }

}