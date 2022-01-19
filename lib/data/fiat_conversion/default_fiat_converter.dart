import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/fiat_conversion/api/fiat_api.dart';
import 'package:cryptowatcherx/data/fiat_conversion/cache/conversion_cache.dart';
import 'package:cryptowatcherx/data/fiat_conversion/conversion.dart';
import 'package:cryptowatcherx/data/fiat_conversion/conversion_source.dart';
import 'package:cryptowatcherx/data/fiat_conversion/fiat_converter.dart';

class DefaultFiatConverter implements FiatConverter {
  ConversionCache _cache;
  FiatApi _api;

  DefaultFiatConverter(this._cache, this._api);

  @override
  Future<Conversion> prefetch(FiatCurrency source, FiatCurrency target) async {
    if (_isSameCurrency(source, target)) {
      return Conversion.identity(target);
    } else if (await _hasCachedValue(source, target, DateTime.now())) {
      return (await _cache.getConversion())!;
    }

    Conversion conversion = await _api.getCurrencyConversionRates(
      source,
      target,
    );
    await _cache.putConversion(conversion);

    return conversion;
  }

  @override
  Future<Money> convert(Money money, FiatCurrency target) async {
    Conversion conversion = await prefetch(money.currency, target);
    return compute(money, conversion);
  }

  Money compute(Money money, Conversion conversion) {
    return money.convertWith(conversion);
  }

  bool _isSameCurrency(FiatCurrency source, FiatCurrency target) {
    return source == target;
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

  @override
  ConversionSource get conversionSource => _api.conversionSource;
}
