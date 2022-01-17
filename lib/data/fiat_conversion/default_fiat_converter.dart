import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/fiat_conversion/api/fiat_api.dart';
import 'package:cryptowatcherx/data/fiat_conversion/cache/conversion_cache.dart';
import 'package:cryptowatcherx/data/fiat_conversion/conversion.dart';
import 'package:cryptowatcherx/data/fiat_conversion/fiat_converter.dart';

class DefaultFiatConverter implements FiatConverter {
  ConversionCache _cache;
  FiatApi _api;

  DefaultFiatConverter(this._cache, this._api);

  @override
  Future<Money> convert(Money money, FiatCurrency target) async {
    if (_isSameCurrency(money, target)) {
      return money;
    } else if (await _hasCachedValue(money.currency, target, DateTime.now())) {
      return compute(money, (await _cache.getConversion())!);
    }

    Conversion conversion = await _api.getCurrencyConversionRates(
      money.currency,
      target,
    );
    await _cache.putConversion(conversion);

    return compute(money, conversion);
  }

  Money compute(Money money, Conversion conversion) {
    return money.convertWith(conversion);
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
        !cached.isExpired(now.subtract(Duration(days: 7))) &&
        cached.source == source &&
        cached.target == target;
  }
}
