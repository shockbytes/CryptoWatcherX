


import 'package:cryptowatcherx/data/crypto/price/price_provider.dart';
import 'package:cryptowatcherx/data/crypto/price/price_source.dart';
import 'package:cryptowatcherx/data/fiat_conversion/fiat_converter.dart';

class SettingsBloc {

  final PriceProvider _priceProvider;
  final FiatConverter _fiatConverter;

  SettingsBloc(this._priceProvider, this._fiatConverter);

  PriceSource get priceSource => _priceProvider.priceSource;

  get conversionSource => _fiatConverter.conversionSource;

}