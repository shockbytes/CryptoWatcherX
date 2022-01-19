import 'package:cryptowatcherx/data/investment/firebase_investment_repository.dart';
import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:cryptowatcherx/data/user/firebase_user_repository.dart';
import 'package:cryptowatcherx/data/user/user_repository.dart';
import 'package:get_it/get_it.dart';

class RepositoryInjector {
  RepositoryInjector._();

  static final GetIt _getIt = GetIt.instance;

  static void setup() {
    _setupInvestmentRepository();
    _setupUserRepository();
  }

  static _setupInvestmentRepository() {
    _getIt.registerSingletonAsync<InvestmentRepository>(
      () async => FirebaseInvestmentRepository(),
      dependsOn: [],
    );
  }

  static _setupUserRepository() {
    _getIt.registerSingletonAsync<UserRepository>(
      () async => FirebaseUserRepository(),
      dependsOn: [],
    );
  }
}
