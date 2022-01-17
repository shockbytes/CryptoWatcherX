import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/crypto/price/price_provider.dart';
import 'package:cryptowatcherx/data/fiat_conversion/fiat_converter.dart';
import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';

class Pipeline {
  final PriceProvider _priceProvider;
  final FiatConverter _fiatConverter;
  final FiatCurrency _targetCurrency;

  Pipeline(this._priceProvider, this._fiatConverter, this._targetCurrency);

  Future<List<DevelopedInvestment>> pipeInvestments(
    List<Investment> investments,
  ) {
    return Future.wait(
      investments.map(
        (Investment investment) async => await _pipe(investment),
      ),
    );
  }

  Future<DevelopedInvestment> _pipe(Investment investment) async {

    // Load price per Unit
    Money currentPricePerUnit = await _priceProvider.getCurrentPrice(
      investment.currency,
    );

    // Load price per purchased amount
    Money currentPrice = currentPricePerUnit.times(investment.amount);

    // Convert to suitable currency
    Money priceInTargetCurrency = await _fiatConverter.convert(
      currentPrice,
      _targetCurrency,
    );

    return DevelopedInvestment(
      investment: investment,
      currentPrice: priceInTargetCurrency,
    );
  }
}
