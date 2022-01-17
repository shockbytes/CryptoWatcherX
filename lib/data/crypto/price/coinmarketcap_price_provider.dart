import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/crypto/price/price_provider.dart';
import 'package:cryptowatcherx/data/crypto/price/price_source.dart';

class CoinmarketCapPriceProvider implements PriceProvider {
  @override
  Future<Money> getCurrentPrice(CryptoCurrency cryptoCurrency) async {
    // TODO Implement
    return Money(
      amount: 14.0,
      currency: FiatCurrency.usd,
    );
  }

  /*

      @GET("v1/cryptocurrency/quotes/latest")
    fun getSpotPrice(
        @Path("symbol") cryptoCurrencies: String,
        @Query("CMC_PRO_API_KEY") apiKey: String = API_KEY
    ): Observable<List<CoinMarketCapApiObject>>

    companion object {

        const val SERVICE_ENDPOINT = "https://pro-api.coinmarketcap.com"
        private const val API_KEY = "719be2f8-d2cc-4d61-a011-e18bcb841261"
    }

   */

  @override
  PriceSource get priceSource => PriceSource(
        name: 'CoinmarketCap',
        icon: 'TODO',
      );
}
