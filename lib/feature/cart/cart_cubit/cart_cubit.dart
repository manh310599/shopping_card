import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/data/model/shopping_card.dart';
import 'package:shoppingcart/data/repo/i_shopping_repo.dart';
import 'package:shoppingcart/feature/cart/cart_cubit/cart_state.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/local/database_helper.dart';
import '../../../data/repo/shopping_repo.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoading());

  late final Database db;

  final IShoppingRepo repo = ShoppingRepo();

  init() async {

    db = await DatabaseHelper.instance.database;
    final listShoppingCard = await repo.getShoppingCards(db);

    emit(CartLoaded(
      products: listShoppingCard ?? [],
      total: listShoppingCard?.fold(
          0, (total, e) => total! + e.product.price! * e.quantity) ?? 0,
    ));
  }

  void changeQuality(int id, int quantity) {
    final products = (state as CartLoaded)
        .products
        .map((e) {
          if (e.id == id) {
            return e.copyWith(
              quantity: quantity,
            );
          }
          return e;
        })
        .cast<ShoppingCard>()
        .toList();

    repo.updateShoppingCard(db, id, quantity);

    emit(
      (state as CartLoaded).copyWith(
        products: products,
        total: products.fold(
            0, (total, e) => total! + e.product.price! * e.quantity),
      ),
    );
  }

  Future<void> removeProduct(int id) async {
    final products =
        (state as CartLoaded).products.where((e) => e.id != id).toList();

    final newTotal = calculateTotalPrice(products);
    await repo.deleteShoppingCard(db, id);
    emit(
      CartLoaded(products: products, total: newTotal),
    );
  }

  int calculateTotalPrice(List<ShoppingCard> products) {
    return products.fold(
      0,
      (total, e) => total + (e.product.price ?? 0) * e.quantity,
    );
  }

  order() {
    repo.clearShoppingCart(db);
  }


}
