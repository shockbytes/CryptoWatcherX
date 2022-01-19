import 'package:cryptowatcherx/data/core/api/base_api_client.dart';
import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/fiat_conversion/api/fiat_api.dart';
import 'package:cryptowatcherx/data/fiat_conversion/conversion.dart';
import 'package:cryptowatcherx/data/fiat_conversion/conversion_source.dart';

import 'fixer_io_response.dart';

class ExchangeRatesIoApi implements FiatApi {
  final _API_KEY = 'f2984427db1fe53732506d9fcac18dd4';

  @override
  Future<Conversion> getCurrencyConversionRates(
    FiatCurrency source,
    FiatCurrency target,
  ) {
    return BaseApiClient.get(
      'http://api.exchangeratesapi.io/v1/latest',
      query: {
        'symbols': [source, target].map((e) => e.code).join(','),
        'access_key': _API_KEY
      },
    ).then((json) {
      return FixerIoResponse.fromJson(json);
    }).then(
      (value) {
        FiatCurrency base = FiatCurrencyExtension.ofCode(value.base)!;

        double rate = (base == target)
            ? (1 / value.rates[source.code])
            : value.rates[target.code];

        return Conversion(
          source: source,
          target: target,
          rate: rate,
          timestamp: DateTime.now(),
        );
      },
    );
  }

  @override
  ConversionSource get conversionSource => ConversionSource(
        name: 'exchangeratesapi.io',
        icon: 'https://exchangeratesapi.io/assets/images/exchangeratesapi_logo_white.svg',
      );
}
