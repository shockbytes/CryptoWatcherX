import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/crypto/image/crypto_currency_image_path_service.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';

class CoinViewerCryptoCurrencyImagePathService
    implements CryptoCurrencyImagePathService {
  @override
  Widget buildCryptoCurrencyImage(
    CryptoCurrency currency, {
    int size = 64,
    Color color = CryptoColors.background,
  }) {
    return CachedNetworkImage(
      imageUrl:
          'https://images.coinviewer.io/currencies/${size}x$size/${currency.code.toLowerCase()}.png',
      errorWidget: (context, url, error) => Container(
        width: size.toDouble(),
        color: Colors.red,
      ),
      placeholder: (context, url) => Container(
        width: size.toDouble(),
      ),
      height: size.toDouble(),
    );
  }
}
