import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';

class InvestmentMapper {
  Map<String, Object?> mapTo(Investment investment) {
    return {
      'currency': {'code': investment.currency.code},
      'buyingPrice': {
        'currency': investment.buyingPrice.currency.code,
        'amount': investment.buyingPrice.amount,
      },
      'buyingTime': investment.buyingTime.toIso8601String(),
      'amount': investment.amount,
    };
  }

  Investment? mapFrom(Map<Object?, Object?> value) {

    var currencyObject = value['currency'] as Map<Object?, Object?>;
    var buyingPriceObject = value['buyingPrice'] as Map<Object?, Object?>;

    CryptoCurrency currency = CryptoCurrencyExtension.ofCode(
      currencyObject['code'] as String,
    );
    DateTime buyingTime = DateTime.parse(value['buyingTime'] as String);
    double amount = (value['amount'] as int).toDouble();
    Money buyingPrice = Money(
      amount: (buyingPriceObject['amount'] as int).toDouble(),
      currency: FiatCurrencyExtension.ofCode(
        buyingPriceObject['currency'] as String,
      )!,
    );

    return Investment(
        currency: currency,
        buyingTime: buyingTime,
        amount: amount,
        buyingPrice: buyingPrice);
  }
}
