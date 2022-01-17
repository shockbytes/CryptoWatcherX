

import '../conversion.dart';

abstract class ConversionCache {

  Future<Conversion?> getConversion();

  Future putConversion(Conversion conversion);
}