import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/feature/cart/cart_cubit/cart_state.dart';

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
              body: const Center(
                child: Text('Cart'),
              ),
            );
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
