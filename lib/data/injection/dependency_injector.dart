import 'package:cryptowatcherx/data/injection/service_injector.dart';
import 'package:get_it/get_it.dart';

import 'api_injector.dart';
import 'bloc_injector.dart';
import 'repository_injector.dart';

class DependencyInjector {
  DependencyInjector._();

  static final GetIt _getIt = GetIt.instance;

  static T get<T extends Object>() {
    return _getIt<T>();
  }

  static Future<void> setupDependencyInjection() async {

    ApiInjector.setup();
    RepositoryInjector.setup();
    ServiceInjector.setup();
    BlocInjector.setup();

    return _getIt.allReady(timeout: const Duration(seconds: 10));
  }
}
