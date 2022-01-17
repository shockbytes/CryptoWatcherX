import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/crypto/image/crypto_currency_image_path_service.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';

class CoinIconsCryptoCurrencyImagePathService
    implements CryptoCurrencyImagePathService {
  @override
  Widget buildCryptoCurrencyImage(
    CryptoCurrency currency, {
    int size = 64,
    Color color = CryptoColors.background,
  }) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        CryptoColors.background,
        BlendMode.color,
      ),
      child: CachedNetworkImage(
        imageUrl:
            'https://api.coinicons.net/icon/${currency.code.toLowerCase()}/128x128',
        errorWidget: (context, url, error) => Container(
          width: size.toDouble(),
          color: Colors.red,
        ),
        placeholder: (context, url) => Container(
          width: size.toDouble(),
        ),
        height: size.toDouble(),
      ),
    );
  }
}
