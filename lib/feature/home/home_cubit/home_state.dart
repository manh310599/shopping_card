

import 'package:shoppingcart/data/model/shopping_card.dart';

import '../../../data/model/product.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> hotProducts;
  final List<Product> products;
  final List<ShoppingCard> shoppingCart;

  HomeLoaded( {required this.shoppingCart,required this.hotProducts, required this.products});

  HomeLoaded copyWith({
    List<ShoppingCard>? shoppingCart,
    List<Product>? hotProducts,
    List<Product>? products,

  }) {
    return HomeLoaded(
      shoppingCart: shoppingCart ?? this.shoppingCart,
      hotProducts: hotProducts ?? this.hotProducts,
      products: products ?? this.products,
    );
  }
}
