import 'package:shoppingcart/data/model/shopping_card.dart';
import 'package:shoppingcart/data/repo/i_shopping_repo.dart';
import "package:sqflite_common/sqlite_api.dart" show ConflictAlgorithm, Database;

class ShoppingRepo extends IShoppingRepo {
  @override
  Future<void> insertShoppingCard(Database db, ShoppingCard card) async {
    final List<Map<String, dynamic>> existingProduct = await db.query(
      'shopping_cart',
      where: 'productId = ?',
      whereArgs: [card.product.id],
    );

    if (existingProduct.isNotEmpty) {
      final int currentQuantity = existingProduct.first['quantity'] as int;
      final int newQuantity = currentQuantity + card.quantity;

      await db.update(
        'shopping_cart',
        {
          'quantity': newQuantity,
        },
        where: 'productId = ?',
        whereArgs: [card.product.id],
      );
    } else {
      await db.insert(
        'shopping_cart',
        card.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }



  @override
  Future<List<ShoppingCard>?> getShoppingCards(Database db) async {
    final List<Map<String, dynamic>?> maps = await db.query('shopping_cart');

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (i) {
      return ShoppingCard.fromJson(maps[i]!);
    });
  }


  @override
  Future<void> updateShoppingCard(Database db, int id, int quantity) async {
     await db.update(
      'shopping_cart',
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  @override
  Future<int> deleteShoppingCard(Database db, int id) async {
    return await db.delete(
      'shopping_cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> clearShoppingCart(Database db) async {
    await db.delete('shopping_cart');
  }
}
