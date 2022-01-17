import 'package:cryptowatcherx/data/core/api/base_api_client.dart';
import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/crypto/price/api/coinmarketcap_response.dart';

import '../crypto_money_snapshot.dart';

class CoinmarketCapApi {
  final _API_KEY = '719be2f8-d2cc-4d61-a011-e18bcb841261';

  Future<List<CryptoMoneySnapshot>> getPrices(List<CryptoCurrency> currencies) {
    return BaseApiClient.get(
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest',
      query: {
        'symbol': currencies.map((e) => e.code).join(','),
        'CMC_PRO_API_KEY': _API_KEY
      },
    ).then(
      (json) {
        return CoinmarketCapResponse.fromJson(json);
      },
    ).then(
      (value) {

        List<CryptoMoneySnapshot> snapshots = [];

        value.data.forEach(
          (key, value) {
            CoinInfo info = CoinInfo.fromJson(value);

            snapshots.add(
              CryptoMoneySnapshot(
                currency: CryptoCurrencyExtension.ofCode(key),
                money: Money(
                  amount: info.quote.usd.price.toDouble(),
                  currency: FiatCurrency.usd,
                ),
                timestamp: DateTime.now(),
              ),
            );
          },
        );

        return snapshots;
      },
    );
  }
}
