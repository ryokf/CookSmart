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
}