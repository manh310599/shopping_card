import 'package:flutter/material.dart';
import 'package:shoppingcart/core/utils/dimen.dart';
import 'package:shoppingcart/data/model/product.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: _hotProduct(context)),
              ),
            ),
          ],
        ));
  }
}

List<Widget> _hotProduct(BuildContext context) {
  final List<Widget> widgets = [];
  widgets.add(
    const SizedBox(
      width: paddingBody / 2,
    ),
  );
  return widgets
    ..addAll(products
        .where((element) => element.hot == true)
        .map(
          (e) => _cardHost(e.image!, e.name!, e.price!, context),
        )
        .toList()
      ..add(
        const SizedBox(
          width: paddingBody / 2,
        ),
      ));
}

Widget _cardHost(String image, String name, int price, BuildContext context) {
  return Card(
    child: Column(
      children: [
        Image.asset(
          image,
          width: (MediaQuery.of(context).size.width -
              2 * paddingBody -
              paddingBody / 2)*0.4,
          height: 100,
        ),
        Text(name),
        Text(price.toString()),
      ],
    ),
  );
}
