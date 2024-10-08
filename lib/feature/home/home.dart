import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/feature/home/component/home_body.dart';
import 'package:shoppingcart/feature/home/home_cubit/home_cubit.dart';
import 'package:shoppingcart/feature/home/home_cubit/home_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..init(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
          if (state is HomeLoading) {
            context.read<HomeCubit>();
            return Scaffold(
              appBar: AppBar(
                elevation: 4.0,
                shadowColor: Colors.grey.withOpacity(0.5),
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                centerTitle: true,
                actions: [
                  InkWell(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    onTap: () async {
                      //      await Navigator.pushNamed(context, '/cart');
                    },
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          onPressed: () async {
                            //   await Navigator.pushNamed(context, '/cart');
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              elevation: 4.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              centerTitle: true,
              actions: [
                InkWell(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  onTap: () async {
                    await Navigator.pushNamed(context, '/cart').then(
                      (value) {
                        if (context.mounted) {
                          context.read<HomeCubit>().backToHome();
                        }
                      },
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () async {
                          await Navigator.pushNamed(context, '/cart').then(
                            (value) {
                              if (context.mounted) {
                                context.read<HomeCubit>().backToHome();
                              }
                            },
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          (state as HomeLoaded).shoppingCart.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            body: const HomeBody(),
          );
        },
      ),
    );
  }
}
