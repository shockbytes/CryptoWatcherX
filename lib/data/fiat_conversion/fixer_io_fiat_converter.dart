

import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/fiat_conversion/fiat_converter.dart';

class FixerIoFiatConverter implements FiatConverter {
  @override
  Future<Money> convert(Money money, FiatCurrency target) async {

    if (_isSameCurrency(money, target)) {
      return money;
    } else if (_hasCachedValue(target)) {
      // TODO apply conversion
      return money;
    }

    // TODO Load conversion and apply
    return money;
  }

  bool _isSameCurrency(Money money, FiatCurrency target) {
    return money.currency == target;
  }

  bool _hasCachedValue(FiatCurrency target) {
    // TODO Cache for 24h to avoid multiple hits on the api
    return false;
  }

}