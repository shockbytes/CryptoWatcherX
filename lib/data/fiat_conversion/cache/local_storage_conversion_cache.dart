import 'package:cryptowatcherx/data/fiat_conversion/cache/conversion_cache.dart';
import 'package:cryptowatcherx/data/fiat_conversion/conversion.dart';
import 'package:localstorage/localstorage.dart';

class LocalStorageConversionCache implements ConversionCache {
  final LocalStorage _storage = LocalStorage('conversion.json');
  final String _key = 'conversion_1';

  @override
  Future<Conversion?> getConversion() async {
    var cached = _storage.getItem(_key);
    if (cached == null) {
      return null;
    }
    return Conversion.fromJson(cached);
  }

  @override
  Future putConversion(Conversion conversion) {
    return _storage.setItem(_key, conversion.toJson());
  }
}
