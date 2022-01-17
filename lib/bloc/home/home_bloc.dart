import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/data/pipeline/pipeline.dart';

class HomeBloc {
  final InvestmentRepository _investmentRepository;
  final Pipeline _pipeline;

  Stream<List<DevelopedInvestment>> get investments =>
      _investmentRepository.getInvestments().asyncMap(
        (investments) async => _pipeline.pipeInvestments(investments),
      );

  HomeBloc(this._investmentRepository, this._pipeline);

  void fetch() {}
}
