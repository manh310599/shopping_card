import 'package:flutter/material.dart';
import 'package:shoppingcart/core/utils/dimen.dart';
import 'package:shoppingcart/data/model/product.dart';
import 'package:shoppingcart/widget/app_button.dart';

class AppDialog {
  static Future<int> productDialog(
      BuildContext context, int quantity, Product product) async {
    TextEditingController controller =
        TextEditingController(text: quantity.toString());
    bool flag = false;

    final result = await showDialog<int>(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return AlertDialog(
                title: Center(child: Text(product.name ?? '')),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40,
                      child: TextField(
                        onChanged: (value) {
                          final parsedValue = int.tryParse(value);
                          if (parsedValue != null &&
                              parsedValue > 0 &&
                              parsedValue <= 999) {
                            setState(() {
                              flag = false;
                            });
                          } else {
                            setState(() {
                              flag = true;
                            });
                          }
                        },
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
                              color: flag
                                  ? Colors.red
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: flag
                                  ? Colors.red
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: flag
                                  ? Colors.red
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    flag
                        ? const Padding(
                            padding: EdgeInsets.only(left: paddingBody / 2),
                            child: Text(
                              'Quantity cannot exceed 999',
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                actions: [
                  flag
                      ? AppButton.offButton(context: context, text: 'Submit')
                      : AppButton.normalButton(
                          context: context,
                          text: 'Submit',
                          onPressed: () {
                            Navigator.pop(
                                context, int.tryParse(controller.text) ?? 1);
                          },
                        ),
                ],
              );
            },
          ),
        );
      },
    );

    return result ?? 1;
  }

  static void orderSuccessfully(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('Order successfully')),
          actions: [
            AppButton.normalButton(
              context: context,
              text: 'Back to Home',
              onPressed: () {
                Navigator.popUntil(
                  context,
                  (route) => route.isFirst,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
