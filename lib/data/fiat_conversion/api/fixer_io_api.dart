import 'package:cryptowatcherx/data/core/api/base_api_client.dart';
import 'package:cryptowatcherx/data/core/money.dart';

import 'fixer_io_response.dart';

class FixerIoApi {
  // This is a key for the free plan, there's not much to gain here.
  final _API_KEY = 'e2ff830729525d15d5a40f0f327f7cd6';

  Future<FixerIoResponse> getCurrencyConversionRates(
    List<FiatCurrency> targetCurrencies,
  ) {
    return BaseApiClient.get(
      'http://data.fixer.io/latest',
      query: {
        'symbols': targetCurrencies.map((e) => e.code).join(','),
        'access_key': _API_KEY
      },
    ).then((json) => FixerIoResponse.fromJson(json));
  }
}
