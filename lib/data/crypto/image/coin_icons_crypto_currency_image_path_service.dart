import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/crypto/image/crypto_currency_image_path_service.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';

class CoinIconsCryptoCurrencyImagePathService
    implements CryptoCurrencyImagePathService {
  @override
  Widget buildCryptoCurrencyImage(CryptoCurrency currency, {
    int size = 64,
    Color color = CryptoColors.background,
  }) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.color,
      ),
      child: _buildChildren(currency, size),
    );
  }

  Widget _buildChildren(CryptoCurrency currency, int size) {
    if (currency.themeConfig.circled) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: _buildColorFilteredImage(currency, size),
      );
    } else {
      return _buildColorFilteredImage(currency, size);
    }
  }

  Widget _buildColorFilteredImage(CryptoCurrency currency, int size) {
    return ColorFiltered(
      colorFilter: _getColorFilter(currency.themeConfig.invertColors),
      child: _buildImage(currency, size),
    );
  }

  ColorFilter _getColorFilter(bool invertColors) {
    List<double> matrix = (invertColors)
        ? [
            -1, 0, 0, 0, 255,
            0, -1, 0, 0, 255,
            0, 0, -1, 0, 255,
            0, 0, 0, 1, 0,
        ] : [
            1, 0, 0, 0, 0,
            0, 1, 0, 0, 0,
            0, 0, 1, 0, 0,
            0, 0, 0, 1, 0
    ];

    Matrix4.identity();

    return ColorFilter.matrix(matrix);
  }

  Widget _buildImage(CryptoCurrency currency, int size) {
    return CachedNetworkImage(
      imageUrl: _buildImageUrl(currency),
      errorWidget: (context, url, error) =>
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: size.toDouble(),
              color: Colors.blueGrey,
            ),
          ),
      placeholder: (context, url) =>
          Container(
            width: size.toDouble(),
          ),
      height: size.toDouble(),
    );
  }

  String _buildImageUrl(CryptoCurrency currency) {
    return 'https://api.coinicons.net/icon/${currency.code
        .toLowerCase()}/128x128';
  }
}
