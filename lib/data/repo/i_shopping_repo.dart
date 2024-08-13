import 'package:shoppingcart/data/model/shopping_card.dart';
import 'package:sqflite/sqflite.dart';

abstract class IShoppingRepo {
  Future<void> insertShoppingCard(Database db, ShoppingCard card);

  Future<List<ShoppingCard>?> getShoppingCards(Database db);

  Future<int> updateShoppingCard(Database db, ShoppingCard card);

  Future<int> deleteShoppingCard(Database db, String id);

  Future<void> clearShoppingCart(Database db);
}
