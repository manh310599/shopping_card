import 'package:shoppingcart/data/model/shopping_card.dart';
import 'package:sqflite/sqflite.dart';

abstract class IShoppingRepo {
  Future<void> insertShoppingCard(Database db, ShoppingCard card);

  Future<List<ShoppingCard>?> getShoppingCards(Database db);

  Future<void> updateShoppingCard(Database db, int id,int quantity);

  Future<void> deleteShoppingCard(Database db, int id);

  Future<void> clearShoppingCart(Database db);
}
