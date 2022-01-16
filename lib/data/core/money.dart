class Money {
  final double amount;
  final FiatCurrency currency;

  Money({
    required this.amount,
    required this.currency,
  });

  Money.empty(): amount = 0, currency = FiatCurrency.eur;

  @override
  String toString() {
    return '$amount ${currency.code}';
  }
}

enum FiatCurrency {
  eur,
  usd,
}

extension FiatCurrencyExtension on FiatCurrency {

  String get code {
    switch(this) {
      case FiatCurrency.eur:
        return 'EUR';
      case FiatCurrency.usd:
        return 'USD';
    }
  }

  String get symbol {
    switch (this) {
      case FiatCurrency.eur:
        return '€';
      case FiatCurrency.usd:
        return '\$';
    }
  }

  static FiatCurrency? ofCode(String str) {
    return FiatCurrency.values.firstWhere((currency) => currency.code == str);
  }

}
