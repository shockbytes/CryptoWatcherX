import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';

class CryptoTextStyle {
  CryptoTextStyle._();

  static const primaryFontFamily = 'Spartan';

  static TextStyle get balanceCurrent => const TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w700,
        color: CryptoColors.text,
        fontSize: 32,
      );

  static TextStyle get balanceInitial => const TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w400,
        color: CryptoColors.text,
        fontSize: 24,
      );

  static TextStyle balanceDevelopment(bool isPositive) => TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w700,
        color: isPositive ? Colors.lightGreen : Colors.red,
        fontSize: 16,
      );

  static TextStyle get investmentCardPrimary => const TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w700,
        color: CryptoColors.text,
        fontSize: 18,
      );

  static TextStyle get investmentCardSecondary => const TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w400,
        color: CryptoColors.text,
        fontSize: 16,
      );

  static TextStyle get investmentCardTertiary => const TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w300,
        color: CryptoColors.text,
        fontSize: 12,
      );
}
