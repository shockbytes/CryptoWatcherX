

import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';

class CryptoTextStyle {

  CryptoTextStyle._();

  static TextStyle get balanceCurrent => const TextStyle(
    fontFamily: 'Spartan',
    fontWeight: FontWeight.w700,
    color: CryptoColors.text,
    fontSize: 32,
  );
  static TextStyle get balanceInitial => const TextStyle(
    fontFamily: 'Spartan',
    fontWeight: FontWeight.w400,
    color: CryptoColors.text,
    fontSize: 24,
  );


  static TextStyle balanceDevelopment(bool isPositive) => TextStyle(
    fontFamily: 'Spartan',
    fontWeight: FontWeight.w700,
    color: isPositive ? Colors.lightGreen : Colors.red,
    fontSize: 16,
  );
}