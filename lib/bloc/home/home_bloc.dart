import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/data/pipeline/pipeline.dart';
import 'package:cryptowatcherx/data/user/user_repository.dart';

class HomeBloc {
  final UserRepository _userRepository;
  final InvestmentRepository _investmentRepository;
  final Pipeline _pipeline;

  Stream<List<DevelopedInvestment>> get investments =>
      _investmentRepository.getInvestments().asyncMap(
            (investments) async => _pipeline.pipeInvestments(investments),
          );

  HomeBloc(
    this._userRepository,
    this._investmentRepository,
    this._pipeline,
  );

  void fetch() {}

  void refresh() {
    // TODO
  }

  void logout() {
    _userRepository.logout();
  }
}
