import 'package:flutter/material.dart';
import 'package:shoppingcart/data/model/product.dart';
import 'package:shoppingcart/gen/app_image.dart';

import '../core/utils/app_dialog.dart';
import '../core/utils/dimen.dart';

class AppCardProduct extends StatefulWidget {
  const AppCardProduct({super.key, required this.product});

  final Product product;

  @override
  State<AppCardProduct> createState() => _AppCardProductState();
}

class _AppCardProductState extends State<AppCardProduct> {

  int currentValue = 1;
  int money = 0;
  @override
  void initState() {
    money = widget.product.price ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            widget.product.image ?? AppImage.product_0,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: paddingBody,
        ),
        Expanded(
          child: SizedBox(
            height: 100,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name ?? '',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 150,
                  height: 40,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (currentValue > 0) {
                                  currentValue--;
                                  money = (currentValue *
                                      (widget.product.price ?? 0));
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () async {
                            final result = await AppDialog.productDialog(
                                context, currentValue, widget.product);
                            if (result != 0) {
                              setState(() {
                                currentValue = result;
                                money = currentValue * (widget.product.price ?? 0);
                              });
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '$currentValue',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (currentValue < 999) {
                                  currentValue++;
                                  money = currentValue *
                                      (widget.product.price ?? 0);
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme
                        .of(context)
                        .primaryColor),
                '$money đ̲',
              ),
            ],
          ),
        )
      ],
    );
  }
}
