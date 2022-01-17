

import 'package:cryptowatcherx/data/fiat_conversion/cache/conversion_cache.dart';
import 'package:cryptowatcherx/data/fiat_conversion/conversion.dart';

class InMemoryConversionCache implements ConversionCache {

  Conversion? _cache = null;

  @override
  Future<Conversion?> getConversion() async {
    return _cache;
  }

  @override
  Future putConversion(Conversion conversion) async {
    print('Cache conversion!');
    _cache = conversion;
  }

}