import 'package:cryptowatcherx/data/investment/in_memory_investment_repository.dart';
import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:get_it/get_it.dart';

class RepositoryInjector {
  RepositoryInjector._();

  static final GetIt _getIt = GetIt.instance;

  static void setup() {
    _setupInvestmentRepository();
  }

  static _setupInvestmentRepository() {
    _getIt.registerSingletonAsync<InvestmentRepository>(
      () async => InMemoryInvestmentRepository(),
      dependsOn: [],
    );
  }
}
