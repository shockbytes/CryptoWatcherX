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
  gtc,
  hod,
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
      case CryptoCurrency.hod:
        return 'HoDooi.com';
    }
  }

  CryptoThemeConfig get themeConfig {
    switch (this) {
      case CryptoCurrency.btc:
        return CryptoThemeConfig();
      case CryptoCurrency.eth:
        return CryptoThemeConfig(
          circled: true,
          invertColors: true,
        );
      case CryptoCurrency.cro:
        return CryptoThemeConfig();
      case CryptoCurrency.quick:
        return CryptoThemeConfig();
      case CryptoCurrency.luna:
        return CryptoThemeConfig();
      case CryptoCurrency.api3:
        return CryptoThemeConfig(
          circled: true,
          invertColors: false,
        );
      case CryptoCurrency.poly:
        return CryptoThemeConfig();
      case CryptoCurrency.tribe:
        return CryptoThemeConfig(
          circled: true,
          invertColors: false,
        );
      case CryptoCurrency.near:
        return CryptoThemeConfig(
          circled: true,
          invertColors: true,
        );
      case CryptoCurrency.rsr:
        return CryptoThemeConfig();
      case CryptoCurrency.band:
        return CryptoThemeConfig();
      case CryptoCurrency.joe:
        return CryptoThemeConfig();
      case CryptoCurrency.gtc:
        return CryptoThemeConfig();
      case CryptoCurrency.hod:
        return CryptoThemeConfig(
          circled: true,
        );
    }
  }

  String get code {
    return name.toUpperCase();
  }

  static CryptoCurrency ofCode(String str) {
    return CryptoCurrency.values.firstWhere((element) => element.code == str);
  }
}

class CryptoThemeConfig {
  final bool invertColors;
  final bool circled;

  CryptoThemeConfig({
    this.invertColors = false,
    this.circled = false,
  });
}
