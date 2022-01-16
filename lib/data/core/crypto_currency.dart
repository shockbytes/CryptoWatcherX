enum CryptoCurrency {
  btc,
  eth,
}

extension CryptoCurrencyExtension on CryptoCurrency {
  String get name {
    switch (this) {
      case CryptoCurrency.btc:
        return 'Bitcoin';
      case CryptoCurrency.eth:
        return 'Ethereum';
    }
  }

  String get code {
    switch (this) {
      case CryptoCurrency.btc:
        return 'BTC';
      case CryptoCurrency.eth:
        return 'ETH';
    }
  }
}
