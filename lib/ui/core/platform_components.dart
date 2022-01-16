import 'dart:io';

import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformComponents {
  static Widget textInput(
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
  }) {
    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoTextField(
        controller: controller,
        keyboardType: inputType,
        cursorColor: CryptoColors.accent,
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(6.0),
        ),
      );
    } else {
      return TextField(
        controller: controller,
        keyboardType: inputType,
      );
    }
  }
}
