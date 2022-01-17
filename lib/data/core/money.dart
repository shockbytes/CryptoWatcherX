class Money {
  final double amount;
  final FiatCurrency currency;

  Money({
    required this.amount,
    required this.currency,
  });

  Money times(double multiplier) {
    return Money(
      amount: amount * multiplier,
      currency: currency,
    );
  }

  Money convertWith(double rate) {
    return Money(
      amount: amount * rate,
      currency: currency,
    );
  }

  Money.empty()
      : amount = 0,
        currency = FiatCurrency.eur;

  @override
  String toString() {
    return '${amount.toStringAsFixed(2)} ${currency.code}';
  }
}

enum FiatCurrency {
  eur,
  usd,
}

extension FiatCurrencyExtension on FiatCurrency {
  String get code {
    switch (this) {
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
