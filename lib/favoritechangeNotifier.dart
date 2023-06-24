// ignore_for_file: unused_field, file_names
import 'package:azote/recipe.dart';
import 'package:azote/recipe_box.dart';
import 'package:flutter/foundation.dart';

class FavoriteChangeNotifier with ChangeNotifier {
  Recipe recipe;

  FavoriteChangeNotifier(this.recipe);

  // ignore: unnecessary_getters_setters
  bool get isFavorited => recipe.isFavorited;
  int get favoriteCount => recipe.favoriteCount + (recipe.isFavorited ? 1 : 0);

  set isFavorited(bool isFavorited) {
    recipe.isFavorited = isFavorited;
    RecipeBox.box!.put(recipe.key(), recipe);
    notifyListeners();
  }
}
