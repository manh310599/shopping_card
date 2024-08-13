import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/data/local/database_helper.dart';
import 'package:shoppingcart/data/model/product.dart';
import 'package:shoppingcart/data/model/shopping_card.dart';
import 'package:shoppingcart/data/repo/i_shopping_repo.dart';
import 'package:shoppingcart/data/repo/shopping_repo.dart';
import 'package:shoppingcart/feature/home/home_cubit/home_state.dart';
import 'package:sqflite/sqflite.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());
  late final Database db;

  final IShoppingRepo repo = ShoppingRepo();

  init() async {
    db = await DatabaseHelper.instance.database;
    final listShoppingCard = await repo.getShoppingCards(db);

    Future.delayed(
      const Duration(seconds: 1),
      () {
        emit(HomeLoaded(
          hotProducts: products
              .where(
                (element) => element.hot == true,
              )
              .toList(),
          products: products,
          shoppingCart: listShoppingCard ?? [],
        ));
      },
    );
  }

  void addProductToCart(Product product, int quantity) async {
    repo.insertShoppingCard(
        db, ShoppingCard( product: product, quantity: quantity));

    final listShoppingCard = await repo.getShoppingCards(db);

    emit(
      (state as HomeLoaded).copyWith(
        shoppingCart: listShoppingCard,
      ),
    );
  }
}
