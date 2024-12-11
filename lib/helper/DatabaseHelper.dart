import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('recipes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE recipes (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        imageUrl TEXT,
        summary TEXT,
        timeCooking INTEGER,
        calories REAL,
        healthScore INTEGER,
        ingredients TEXT,
        steps TEXT
      )
    ''');

    await db.execute('''
  CREATE TABLE shopping_list (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ingredientId TEXT,
    name TEXT NOT NULL,
    quantity TEXT,
    unit TEXT,
    isBought INTEGER DEFAULT 0
  )
''');
  }

  Future<void> insertRecipe(Map<String, dynamic> recipe) async {
    final db = await instance.database;
    await db.insert('recipes', recipe,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetchRecipes() async {
    final db = await instance.database;
    return await db.query('recipes');
  }

  Future<void> deleteRecipe(String id) async {
    final db = await instance.database;
    await db.delete('recipes', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> insertShoppingItem(Map<String, dynamic> item) async {
  final db = await instance.database;

  try {
    // Ambil item yang sudah ada berdasarkan ingredientId
    final existingItem = await db.query(
      'shopping_list',
      where: 'ingredientId = ?',
      whereArgs: [item['ingredientId']],
    );

    if (existingItem.isNotEmpty) {
      // Parse quantity yang ada di database dan item baru
      final existingQuantity = double.tryParse(existingItem.first['quantity']?.toString() ?? '0') ?? 0.0;
      final newQuantity = double.tryParse(item['quantity']?.toString() ?? '0') ?? 0.0;

      // Update quantity
      final updatedQuantity = existingQuantity + newQuantity;
      await db.update(
        'shopping_list',
        {'quantity': updatedQuantity.toString()},
        where: 'ingredientId = ?',
        whereArgs: [item['ingredientId']],
      );
    } else {
      // Insert item baru jika tidak ada
      await db.insert(
        'shopping_list',
        item,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  } catch (e) {
    print('Error inserting/updating shopping item: $e');
  }
}

  Future<List<Map<String, dynamic>>> fetchShoppingList(bool isBought) async {
    final db = await instance.database;
    return await db.query(
      'shopping_list',
      where: 'isBought = ?',
      whereArgs: [isBought ? 1 : 0],
    );
  }

  Future<void> updateIsBought(int id, bool isBought) async {
    final db = await DatabaseHelper.instance.database;

    await db.update(
      'shopping_list',
      {'isBought': isBought ? 1 : 0}, // Ubah nilai berdasarkan boolean
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteShoppingItem(int id) async {
    final db = await instance.database;
    await db.delete('shopping_list', where: 'id = ?', whereArgs: [id]);
  }
}
