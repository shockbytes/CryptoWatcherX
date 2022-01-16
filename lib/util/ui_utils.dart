import 'package:flutter/material.dart';

import 'crypto_colors.dart';

class UiUtils {
  UiUtils._();

  static Future<void> showUserDialog(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Okay',
              style: TextStyle(color: CryptoColors.accent),
            ),
          ),
        ],
      ),
    );
  }
}
