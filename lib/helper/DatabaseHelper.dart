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
    unit TEXT
  )
''');

    await db.execute('''
  CREATE TABLE meal_plan (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    day TEXT NOT NULL,         -- Hari dalam seminggu
    recipeId TEXT,             -- ID Resep (Foreign Key)
    title TEXT NOT NULL,       -- Judul Resep
    imageUrl TEXT,             -- URL Gambar Resep
    ingredients TEXT,
    steps TEXT,
    calories REAL,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP -- Waktu Ditambahkan
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
        final existingQuantity = double.tryParse(
                existingItem.first['quantity']?.toString() ?? '0') ??
            0.0;
        final newQuantity =
            double.tryParse(item['quantity']?.toString() ?? '0') ?? 0.0;

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

  Future<List<Map<String, dynamic>>> fetchShoppingList() async {
    final db = await instance.database;
    return await db.query('shopping_list');
  }

  Future<void> deleteShoppingItem(int id) async {
    final db = await instance.database;
    await db.delete('shopping_list', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> insertMealPlan(String day, Map<String, dynamic> recipe) async {
    final db = await instance.database;
    await db.insert(
      'meal_plan',
      {
        'day': day,
        'recipeId': recipe['id'],
        'title': recipe['title'],
        'imageUrl': recipe['imageUrl'],
        'calories': recipe['calories'],
        'ingredients': recipe['ingredients'],
        'steps': recipe['steps'],
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> fetchMealPlansByDay(String day) async {
    final db = await instance.database;
    return await db.query('meal_plan', where: 'day = ?', whereArgs: [day]);
  }

  Future<void> deleteMealPlan(String id) async {
    final db = await instance.database;
    await db.delete('meal_plan', where: 'id = ?', whereArgs: [id]);
  }
}
