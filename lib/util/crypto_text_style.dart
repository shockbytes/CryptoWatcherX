import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';

class CryptoTextStyle {
  CryptoTextStyle._();

  static const primaryFontFamily = 'Spartan';

  static TextStyle get textDefault => const TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w400,
        color: CryptoColors.text,
        fontSize: 16,
      );

  static TextStyle textDropdown = const TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w500,
        color: CryptoColors.text,
        fontSize: 12,
      );

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
        color: isPositive ? CryptoColors.accent: Colors.white54,
        fontSize: 16,
      );

  static TextStyle get investmentCardPrimary => const TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w700,
        color: CryptoColors.text,
        fontSize: 14,
      );

  static TextStyle get investmentCardSecondary => const TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w400,
        color: CryptoColors.text,
        fontSize: 12,
      );

  static TextStyle get investmentCardTertiary => const TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w300,
        color: CryptoColors.text,
        fontSize: 12,
      );

  static TextStyle dateMonthTextStyle = const TextStyle(
    fontFamily: primaryFontFamily,
    color: CryptoColors.text,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  static TextStyle dateDateTextStyle = const TextStyle(
    fontFamily: primaryFontFamily,
    color: CryptoColors.text,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static TextStyle dateDayTextStyle = const TextStyle(
    fontFamily: primaryFontFamily,
    color: CryptoColors.text,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );
}
