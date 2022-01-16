import 'dart:ui';

import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/widgets.dart';

abstract class CryptoCurrencyImagePathService {
  Widget buildCryptoCurrencyImage(
    CryptoCurrency currency, {
        int size = 64,
        Color color = CryptoColors.background,
  });
}
