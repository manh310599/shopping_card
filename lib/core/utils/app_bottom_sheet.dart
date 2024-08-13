import 'package:flutter/material.dart';
import 'package:shoppingcart/core/utils/dimen.dart';
import 'package:shoppingcart/data/model/product.dart';
import 'package:shoppingcart/widget/app_bottom_sheet_custom.dart';
import 'package:shoppingcart/widget/app_card_product.dart';

import '../../widget/app_button.dart';

class AppBottomSheet {
  static void buyProduct(
      BuildContext context, Product product, Function(int value) click) {
    int currentValue = 1;
    AppBottomSheetCustom.showBottomSheet(
      context: context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingBody / 2),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: paddingBody * 2,
                ),
                AppCardProduct(
                  product: product,
                  onValueChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                ),
                const SizedBox(
                  height: paddingBody * 2,
                ),
                AppButton.normalButton(
                  context: context,
                  text: 'Add to card',
                  onPressed: () {
                    click(currentValue);
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: paddingBody,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
