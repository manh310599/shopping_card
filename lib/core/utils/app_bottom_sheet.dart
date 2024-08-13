import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/core/utils/app_dialog.dart';
import 'package:shoppingcart/core/utils/dimen.dart';
import 'package:shoppingcart/data/model/product.dart';
import 'package:shoppingcart/gen/app_image.dart';
import 'package:shoppingcart/widget/app_bottom_sheet_custom.dart';
import 'package:shoppingcart/widget/app_card_product.dart';

import '../../widget/app_button.dart';

class AppBottomSheet {
  static void buyProduct(BuildContext context, Product product,Function(int value) click) {
    int currentValue = 1;
    int money = product.price ?? 0;
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
                AppCardProduct(product: product,onValueChanged: (value) {
                  setState(() {
                    currentValue = value;
                    money = currentValue * (product.price ?? 0);
                  });

                },),
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
