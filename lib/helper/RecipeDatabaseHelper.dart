import 'package:sqflite/sqflite.dart';

class RecipeDatabaseHelper {
  final Database db;

  static var instance;

  RecipeDatabaseHelper(this.db);

  // Cek apakah resep sudah ada di database
  Future<bool> isRecipeSaved(String recipeId) async {
    final result = await db.query(
      'recipes', // Nama tabel
      where: 'id = ?', // Kondisi untuk id tertentu
      whereArgs: [recipeId],
    );
    return result.isNotEmpty; // Jika hasil tidak kosong, berarti resep sudah disimpan
  }
}