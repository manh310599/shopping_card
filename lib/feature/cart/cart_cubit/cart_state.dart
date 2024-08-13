import 'package:shoppingcart/data/model/shopping_card.dart';

abstract class CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<ShoppingCard> products;
  final int total;

  CartLoaded({required this.products, required this.total});

  CartLoaded copyWith({List<ShoppingCard>? products, int? total}) {
    return CartLoaded(
      products: products ?? this.products,
      total: total ?? this.total,
    );
  }
}
