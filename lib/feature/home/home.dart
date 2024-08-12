import 'package:flutter/material.dart';
import 'package:shoppingcart/core/utils/dimen.dart';
import 'package:shoppingcart/data/model/product.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 4.0,
          shadowColor: Colors.grey.withOpacity(0.5),
          title: Text(
            'Home',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: SizedBox(
                height: paddingBody,
              ),
            ),
            _hotProductTitle(context),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: paddingBody,
              ),
            ),
            SliverToBoxAdapter(
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _hotProduct(context)),
            ),
          ],
        ));
  }
}

Widget _hotProductTitle(BuildContext context) {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: paddingBody),
    sliver: SliverToBoxAdapter(
      child: Text(
        'HOT Products 🔥',
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
              _cardHost(e.image!, e.name!, e.price!, context),
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

Widget _cardHost(String image, String name, int price, BuildContext context) {
  return SizedBox(

    width: (MediaQuery.of(context).size.width -
            2 * paddingBody -
            paddingBody / 2) *
        0.4,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.asset(
            image,
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(name),
                  Text(price.toString()),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
