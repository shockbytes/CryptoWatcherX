import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/crypto/image/coin_icons_crypto_currency_image_path_service.dart';
import 'package:cryptowatcherx/data/crypto/image/crypto_currency_image_path_service.dart';
import 'package:cryptowatcherx/data/crypto/price/coinmarketcap_price_provider.dart';
import 'package:cryptowatcherx/data/crypto/price/price_provider.dart';
import 'package:cryptowatcherx/data/fiat_conversion/fixer_io_fiat_converter.dart';
import 'package:cryptowatcherx/data/fiat_conversion/fiat_converter.dart';
import 'package:cryptowatcherx/data/pipeline/pipeline.dart';
import 'package:get_it/get_it.dart';

class ServiceInjector {
  ServiceInjector._();

  static final GetIt _getIt = GetIt.instance;

  static void setup() {
    _setupImagePathService();
    _setupPriceProvider();
    _setupFiatConverter();
    _setupPipeline();
  }

  static _setupImagePathService() {
    _getIt.registerSingleton<CryptoCurrencyImagePathService>(
      CoinIconsCryptoCurrencyImagePathService(),
    );
  }

  static _setupPriceProvider() {
    _getIt.registerSingletonAsync<PriceProvider>(
      () async => CoinmarketCapPriceProvider(),
      dependsOn: [],
    );
  }

  static _setupFiatConverter() {
    _getIt.registerSingletonAsync<FiatConverter>(
      () async => FixerIoFiatConverter(),
      dependsOn: [],
    );
  }

  static _setupPipeline() {
    _getIt.registerSingletonWithDependencies<Pipeline>(
      () => Pipeline(
        _getIt<PriceProvider>(),
        _getIt<FiatConverter>(),
        FiatCurrency.eur,
      ),
      dependsOn: [
        PriceProvider,
        FiatConverter,
      ],
    );
  }
}
