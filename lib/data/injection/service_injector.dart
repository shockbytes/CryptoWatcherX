import 'package:cryptowatcherx/data/crypto/image/crypto_coins_crypto_currency_image_path_service.dart';
import 'package:cryptowatcherx/data/crypto/image/crypto_currency_image_path_service.dart';
import 'package:get_it/get_it.dart';

class ServiceInjector {
  ServiceInjector._();

  static final GetIt _getIt = GetIt.instance;

  static void setup() {
    _setupImagePathService();
  }

  static _setupImagePathService() {
    _getIt.registerSingleton<CryptoCurrencyImagePathService>(
      CryptoCoinsCryptoCurrencyImagePathService(),
    );
  }
}
