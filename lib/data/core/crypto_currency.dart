enum CryptoCurrency {
  btc,
  eth,
  cro,
  quick,
  luna,
  api3,
  poly,
  tribe,
  near,
  rsr,
  band,
  joe,
  gtc
}

extension CryptoCurrencyExtension on CryptoCurrency {
  String get coinName {
    switch (this) {
      case CryptoCurrency.btc:
        return 'Bitcoin';
      case CryptoCurrency.eth:
        return 'Ethereum';
      case CryptoCurrency.cro:
        return 'Crypto.com Coin';
      case CryptoCurrency.quick:
        return 'QuickSwap';
      case CryptoCurrency.luna:
        return 'Terra';
      case CryptoCurrency.api3:
        return 'API3';
      case CryptoCurrency.poly:
        return 'Polymath';
      case CryptoCurrency.tribe:
        return 'Tribe';
      case CryptoCurrency.near:
        return 'NEAR Protocol';
      case CryptoCurrency.rsr:
        return 'Reserve Rights';
      case CryptoCurrency.band:
        return 'Band Protocol';
      case CryptoCurrency.joe:
        return 'JOE';
      case CryptoCurrency.gtc:
        return 'Gitcoin';
    }
  }

  String get code {
    return name.toUpperCase();
  }

  static CryptoCurrency ofCode(String str) {
    return CryptoCurrency.values.firstWhere((element) => element.code == str);
  }
}
