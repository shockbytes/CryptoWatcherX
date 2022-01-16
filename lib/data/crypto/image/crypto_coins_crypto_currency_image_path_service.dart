import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/crypto/image/crypto_currency_image_path_service.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';

class CryptoCoinsCryptoCurrencyImagePathService
    implements CryptoCurrencyImagePathService {
  @override
  Widget buildCryptoCurrencyImage(
    CryptoCurrency currency, {
    int size = 64,
    Color color = CryptoColors.background,
  }) {
    return CachedNetworkImage(
      imageUrl:
          'https://cryptoicons.org/api/color/${currency.code.toLowerCase()}/$size/${color.value.toRadixString(16).substring(2)}',
      errorWidget: (context, url, error) => Container(
        width: size.toDouble(),
      ),
      placeholder: (context, url) => Container(
        width: size.toDouble(),
      ),
      height: size.toDouble(),
    );
  }
}
