import 'package:azote/recipe.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RecipeDataBase {
  RecipeDataBase._();

  static final RecipeDataBase instance = RecipeDataBase._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    // ignore: await_only_futures
    _database = await initDB();
    return _database;
  }

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), "recipe_database.db"),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE recipe(title TEXT PRIMARY KEY, user TEXT, imageUrl TEXT, description TEXT, isFavorited INTEGER, favoriteCount INTEGER)");
      },
      version: 1,
    );
  }

  void insertRecipe(Recipe recipe) async {
    final Database? db = await database;

    await db?.insert(
      'recipe',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

void updateRecipe(Recipe recipe)
  async {
    final Database? db = await database;
    await db?.update('recipe', recipe.toMap(), where: "title = ?", whereArgs: [recipe.title]);
  }
}
