import 'package:cryptowatcherx/bloc/add/add_bloc.dart';
import 'package:cryptowatcherx/bloc/balance/balance_bloc.dart';
import 'package:cryptowatcherx/bloc/home/home_bloc.dart';
import 'package:cryptowatcherx/bloc/login/login_bloc.dart';
import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:get_it/get_it.dart';

class BlocInjector {
  BlocInjector._();

  static final GetIt _getIt = GetIt.instance;

  static void setup() {
    _setupHomeBloc();
    _setupBalanceBloc();
    _setupLoginBloc();
    _setupAddBloc();
  }

  static _setupHomeBloc() {
    _getIt.registerSingletonWithDependencies<HomeBloc>(
      () => HomeBloc(
        _getIt<InvestmentRepository>(),
      ),
      dependsOn: [
        InvestmentRepository,
      ],
    );
  }

  static _setupBalanceBloc() {
    _getIt.registerSingletonWithDependencies<BalanceBloc>(
      () => BalanceBloc(
        _getIt<InvestmentRepository>(),
      ),
      dependsOn: [
        InvestmentRepository,
      ],
    );
  }

  static _setupLoginBloc() {
    _getIt.registerSingletonWithDependencies<LoginBloc>(
      () => LoginBloc(),
      dependsOn: [],
    );
  }

  static _setupAddBloc() {
    _getIt.registerSingletonWithDependencies<AddBloc>(
      () => AddBloc(
        _getIt<InvestmentRepository>(),
      ),
      dependsOn: [
        InvestmentRepository,
      ],
    );
  }
}
