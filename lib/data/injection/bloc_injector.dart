import 'package:cryptowatcherx/bloc/add/add_bloc.dart';
import 'package:cryptowatcherx/bloc/balance/balance_bloc.dart';
import 'package:cryptowatcherx/bloc/home/home_bloc.dart';
import 'package:cryptowatcherx/bloc/login/login_bloc.dart';
import 'package:cryptowatcherx/bloc/settings/settings_bloc.dart';
import 'package:cryptowatcherx/data/crypto/price/price_provider.dart';
import 'package:cryptowatcherx/data/fiat_conversion/fiat_converter.dart';
import 'package:cryptowatcherx/data/investment/investment_repository.dart';
import 'package:cryptowatcherx/data/pipeline/pipeline.dart';
import 'package:cryptowatcherx/data/user/user_repository.dart';
import 'package:get_it/get_it.dart';

class BlocInjector {
  BlocInjector._();

  static final GetIt _getIt = GetIt.instance;

  static void setup() {
    _setupHomeBloc();
    _setupBalanceBloc();
    _setupLoginBloc();
    _setupAddBloc();
    _setupSettingsBloc();
  }

  static _setupHomeBloc() {
    _getIt.registerSingletonWithDependencies<HomeBloc>(
      () => HomeBloc(_getIt<UserRepository>(), _getIt<InvestmentRepository>(),
          _getIt<Pipeline>()),
      dependsOn: [InvestmentRepository, Pipeline],
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
    _getIt.registerSingleton<LoginBloc>(LoginBloc());
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

  static _setupSettingsBloc() {
    _getIt.registerSingletonWithDependencies<SettingsBloc>(
      () => SettingsBloc(
        _getIt<PriceProvider>(),
        _getIt<FiatConverter>(),
      ),
      dependsOn: [
        PriceProvider,
        FiatConverter
      ],
    );
  }
}
