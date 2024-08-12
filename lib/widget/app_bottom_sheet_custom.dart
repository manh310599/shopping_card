import 'package:flutter/material.dart';

class AppBottomSheetCustom {
  static void showBottomSheet({
    required BuildContext context,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(onTap: () {
          FocusScope.of(context).unfocus();

        },child: child);
      },
    );
  }
}