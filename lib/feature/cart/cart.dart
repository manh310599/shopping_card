import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/core/utils/app_dialog.dart';
import 'package:shoppingcart/core/utils/dimen.dart';
import 'package:shoppingcart/data/model/product.dart';
import 'package:shoppingcart/feature/cart/cart_cubit/cart_state.dart';
import 'package:shoppingcart/widget/app_button.dart';
import 'package:shoppingcart/widget/app_card_product.dart';

import 'cart_cubit/cart_cubit.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit()..init(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (BuildContext context, state) {
          if (state is CartLoaded) {
            return Scaffold(
                appBar: AppBar(
                  elevation: 4.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  title: Text(
                    'Cart (${state.products.fold(0, (total, e) => total + e.quantity)})',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  iconTheme: Theme.of(context).iconTheme,
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    _listProduct(context, state),
                    _totalPrice(context, state),
                  ],
                ));
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

Widget _listProduct(BuildContext context, CartLoaded state) {
  return Expanded(
    child: ListView.separated(
      padding: const EdgeInsets.all(paddingBody / 2),
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        final e = state.products[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(paddingBody),
            child: AppCardProduct(
              product: Product(
                id: e.product.id,
                name: e.product.name,
                description: e.product.description,
                price: e.product.price,
                image: e.product.image,
                hot: e.product.hot,
              ),
              quantity: e.quantity,
             onValueChanged: (value) {
                context.read<CartCubit>().changeQuality(
                      e.id as String,
                      value,
                    );
              },
              onTapRemove: () {
                context.read<CartCubit>().removeProduct(
                      e.id as String,
                    );
              },
            ),
          ),
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: paddingBody / 2), // Kích thước ngăn cách
    ),
  );
}

Widget _totalPrice(BuildContext context, CartLoaded state) {
  return Padding(
    padding: const EdgeInsets.all(paddingBody / 2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total price ',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text('${state.total} đ̲',
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const SizedBox(
          height: paddingBody,
        ),
        state.products.isNotEmpty ?AppButton.normalButton(
          context: context,
          text: 'Order',
          onPressed: () {
            context.read<CartCubit>().order();
            AppDialog.orderSuccessfully(context);
          },
        ) : AppButton.offButton(
          context: context,
          text: 'Order',

        ),
      ],
    ),
  );
}
