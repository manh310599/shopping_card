import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' ;

class DatabaseHelper {
  // Private constructor để không ai có thể khởi tạo từ bên ngoài
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Nếu chưa có database, sẽ khởi tạo
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'shopping_cart.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE shopping_cart(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId TEXT,
        name TEXT,
        description TEXT,
        price INTEGER,
        image TEXT,
        quantity INTEGER
      )
    ''');
  }
}
