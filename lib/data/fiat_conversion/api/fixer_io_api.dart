import 'package:cryptowatcherx/data/core/api/base_api_client.dart';
import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/fiat_conversion/api/fiat_api.dart';
import 'package:cryptowatcherx/data/fiat_conversion/conversion.dart';
import 'package:cryptowatcherx/data/fiat_conversion/conversion_source.dart';

import 'fixer_io_response.dart';

class FixerIoApi implements FiatApi {
  // This is a key for the free plan, there's not much to gain here.
  final _API_KEY = 'e2ff830729525d15d5a40f0f327f7cd6';

  Future<Conversion> getCurrencyConversionRates(
    FiatCurrency source,
    FiatCurrency target,
  ) {
    return BaseApiClient.get(
      'http://data.fixer.io/latest',
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
  ConversionSource get conversionSource => throw UnimplementedError();
}
