import 'package:flutter/material.dart';
import 'package:shoppingcart/data/model/product.dart';
import 'package:shoppingcart/widget/app_button.dart';

class AppDialog {
  static Future<int> productDialog(
      BuildContext context, int quantity, Product product) async {
    TextEditingController controller =
        TextEditingController(text: quantity.toString());

    final result = await showDialog<int>(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: AlertDialog(
            title: Center(child: Text(product.name ?? '')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                  child: TextField(
                    autofocus: true,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              AppButton.normalButton(
                context: context,
                text: 'Submit',
                onPressed: () {
                  Navigator.pop(context, int.tryParse(controller.text) ?? 1);
                },
              ),
            ],
          ),
        );
      },
    );

    return result ?? 1;
  }
}
