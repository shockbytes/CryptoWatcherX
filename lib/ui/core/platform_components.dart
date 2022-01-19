import 'dart:io';

import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:cryptowatcherx/util/crypto_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformComponents {
  static Widget textInput(
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
    String? hint,
    bool obscureText = false,
  }) {
    if (hint != null && controller.text.isEmpty) {
      controller.text = hint;
    }

    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoTextField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        style: CryptoTextStyle.textDefault,
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
        obscureText: obscureText,
        style: CryptoTextStyle.textDefault,
        cursorColor: CryptoColors.accent,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              color: CryptoColors.accent,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
      );
    }
  }
}
