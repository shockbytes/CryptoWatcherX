import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/fiat_conversion/api/fixer_io_api.dart';
import 'package:cryptowatcherx/data/fiat_conversion/cache/conversion_cache.dart';
import 'package:cryptowatcherx/data/fiat_conversion/conversion.dart';
import 'package:cryptowatcherx/data/fiat_conversion/fiat_converter.dart';

class FixerIoFiatConverter implements FiatConverter {
  ConversionCache _cache;
  FixerIoApi _api;

  FixerIoFiatConverter(this._cache, this._api);

  @override
  Future<Money> convert(Money money, FiatCurrency target) async {
    if (_isSameCurrency(money, target)) {
      print('Same currency, go back');
      return money;
    } else if (await _hasCachedValue(money.currency, target, DateTime.now())) {
      print('Cached conversion');
      return compute(money, (await _cache.getConversion())!);
    }

    print('Fetch conversion');
    Conversion conversion = await fetchConversion(money.currency, target);
    await _cache.putConversion(conversion);
    print('Conversion: $conversion');

    return compute(money, conversion);
  }

  Money compute(Money money, Conversion conversion) {
    return money.convertWith(conversion.rate);
  }

  Future<Conversion> fetchConversion(
    FiatCurrency source,
    FiatCurrency target,
  ) async {
    return _api.getCurrencyConversionRates([source, target]).then(
      (value) {
        FiatCurrency base = FiatCurrencyExtension.ofCode(value.base)!;

        double rate = (base == target)
            ? (1 / value.rates[source.code])
            : value.rates[target.code];

        return Conversion(
          source: source,
          target: target,
          rate: rate,
          timestamp: DateTime.fromMillisecondsSinceEpoch(value.timestamp),
        );
      },
    );
  }

  bool _isSameCurrency(Money money, FiatCurrency target) {
    return money.currency == target;
  }

  Future<bool> _hasCachedValue(
    FiatCurrency source,
    FiatCurrency target,
    DateTime now,
  ) async {
    var cached = await _cache.getConversion();
    return cached != null &&
        !cached.isExpired(now.subtract(Duration(days: 1))) &&
        cached.source == source &&
        cached.target == target;
  }
}
