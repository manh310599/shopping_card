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


    Future.delayed(
      const Duration(seconds: 1),
      () async {
        emit(HomeLoaded(
          hotProducts: products
              .where(
                (element) => element.hot == true,
              )
              .toList(),
          products: products,
          shoppingCart: await getShoppingCard() ?? [],
        ));
      },
    );
  }

  Future<List<ShoppingCard>?> getShoppingCard() async {
    final listShoppingCard = await repo.getShoppingCards(db);


    return listShoppingCard;
  }

  backToHome() async {

    final result =  await getShoppingCard();
    emit(
      (state as HomeLoaded).copyWith(
        shoppingCart: result ?? [],
      ),
    );
  }

  void addProductToCart(Product product, int quantity) async {
    await repo.insertShoppingCard(
        db, ShoppingCard( product: product, quantity: quantity));

    final result =  await getShoppingCard();

    emit(
      (state as HomeLoaded).copyWith(
        shoppingCart: result ?? [],
      ),
    );
  }
}
