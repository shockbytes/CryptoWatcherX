import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/crypto/price/crypto_money_snapshot.dart';
import 'package:cryptowatcherx/data/crypto/price/price_provider.dart';
import 'package:cryptowatcherx/data/fiat_conversion/fiat_converter.dart';
import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';
import 'package:cryptowatcherx/data/pipeline/developed_investments_publisher.dart';

class Pipeline {
  final PriceProvider _priceProvider;
  final FiatConverter _fiatConverter;
  final FiatCurrency _targetCurrency;

  Pipeline(this._priceProvider, this._fiatConverter, this._targetCurrency);

  Future<List<DevelopedInvestment>> pipeInvestments(
    List<Investment> investments,
  ) async {
    List<FiatCurrency> fiatCurrencies = _extractFiatCurrencies(investments);
    fiatCurrencies.forEach(
      (fc) async {
        await _fiatConverter.prefetch(fc, _targetCurrency);
      },
    );

    // Load all prices per Unit
    List<CryptoMoneySnapshot> currentPricesPerUnit = await _priceProvider
        .getCurrentPrices(investments.map((e) => e.currency).toList());

    List<DevelopedInvestment> developedInvestments = await Future.wait(
      investments.map(
        (Investment investment) async {
          CryptoMoneySnapshot snapshot = currentPricesPerUnit.firstWhere(
            (CryptoMoneySnapshot s) => s.currency == investment.currency,
          );

          return await _pipe(investment, snapshot.money);
        },
      ),
    );

    DevelopedInvestmentsPublisher.enqueue(developedInvestments);

    return developedInvestments;
  }

  Future<DevelopedInvestment> _pipe(
    Investment investment,
    Money currentPricePerUnit,
  ) async {
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

  List<FiatCurrency> _extractFiatCurrencies(List<Investment> investments) {
    return investments
        .map(
          (e) => e.buyingPrice.currency,
        )
        .toSet()
        .toList();
  }
}
