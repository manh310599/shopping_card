import 'package:flutter/material.dart';
import 'package:shoppingcart/core/utils/dimen.dart';
import 'package:shoppingcart/data/model/product.dart';

import '../../../core/utils/app_bottom_sheet.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: SizedBox(
            height: paddingBody,
          ),
        ),
        _title(context, 'HOT Products 🔥'),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: paddingBody,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.7 -
                2 * paddingBody -
                paddingBody / 2,
            child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _hotProduct(context)),
          ),
        ),
        _title(context, 'ALL Products'),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: paddingBody,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: paddingBody/2),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: products.length,
                  (context, index) {
                return _allProduct(
                  products[index],
                  context,
                );
              },
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: paddingBody,
              mainAxisExtent:
              MediaQuery.of(context).size.width * 0.7 - 2 * paddingBody,
              mainAxisSpacing: paddingBody / 2,
            ),
          ),
        ),
      ],
    );
  }
}


Widget _allProduct(Product product, BuildContext context) {
  return Card(
    color: Theme.of(context).cardColor,
    clipBehavior: Clip.antiAlias,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          product.image ?? '',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingBody / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: paddingBody / 2,
                  ),
                  Text(
                    product.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${product.price} đ̲',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: paddingBody / 2,
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  AppBottomSheet.buyProduct(context, product);
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _title(BuildContext context, String title) {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: paddingBody),
    sliver: SliverToBoxAdapter(
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

List<Widget> _hotProduct(BuildContext context) {
  return products
      .where((element) => element.hot == true)
      .expand(
        (e) => <Widget>[
      const SizedBox(width: paddingBody / 2),
      Stack(
        alignment: Alignment.topLeft,
        children: [
          _cardHost(e, context),
          Container(
            margin: const EdgeInsets.all(paddingBody / 2),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              shape: BoxShape.circle,
            ),
            child: const Text(
              '🔥',
            ),
          )
        ],
      ),
      const SizedBox(width: paddingBody / 2),
    ],
  )
      .toList();
}

Widget _cardHost(Product product, BuildContext context) {
  return SizedBox(
    width: (MediaQuery.of(context).size.width -
        2 * paddingBody -
        paddingBody / 2) *
        0.4,
    child: Card(
      color: Theme.of(context).cardColor,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            product.image ?? '',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingBody / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: paddingBody / 2,
                    ),
                    Text(
                      product.name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${product.price} đ̲',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: paddingBody / 2,
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    AppBottomSheet.buyProduct(context, product);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
