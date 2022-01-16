
import './price_source.dart';

abstract class PriceProvider {

  PriceSource get priceSource;

  Future getCurrentPrice();
}