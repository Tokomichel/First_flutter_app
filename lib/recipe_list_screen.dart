// ignore_for_file: avoid_print

import 'package:azote/modify_recipe_screen.dart';
import 'package:azote/recipe_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:recipe_app/recipe_box.dart';
import 'recipe.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return RecipeListScreenState();
  }
}

class RecipeListScreenState extends State<RecipeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes recettes"),
      ),
      body: /*FutureBuilder<List<Recipe>>*/ ValueListenableBuilder(
          builder: (context, items, _) {
            List<String> keys = items.keys.cast<String>().toList();
            return ListView.builder(
              itemCount: keys.length,
              itemBuilder: (context, index) {
                final recipe = items.get(keys[index]);
                return Dismissible(
                    key: ValueKey(recipe.title),
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirmer"),
                            content: const Text(
                                "Êtes-vous sûr de vouloir supprimer cet élément ?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("ANNULER"),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text(
                                  "SUPPRIMER",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onDismissed: (direction) {
                      print(direction);
                      setState(() {
                        RecipeBox.box?.delete(keys[index]);
                        // RecipeDatabase.instance.deleteRecipe(recipe.title);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${recipe.title} supprimé")));
                    },
                    background: Container(color: Colors.red),
                    child: RecipeItemWidget(
                      recipe: recipe,
                      index: index,
                    ));
              },
            );
          },
          /*future: RecipeDatabase.instance.recipes()*/
          valueListenable: RecipeBox.box!.listenable()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newRecipe');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ignore: must_be_immutable
class RecipeItemWidget extends StatelessWidget {
  RecipeItemWidget({super.key, required this.recipe, this.index});

  final Recipe recipe;
  int? index;

  @override
  Widget build(BuildContext context) {
    isOnline(recipe.imageUrl);
    return GestureDetector(
      onLongPress: () {
        Navigator.pushNamed(context, '/modifyRecipe',
            arguments: Toko(recipe, index!));
        print("Tu as appuyer longtemps");
      },
      onTap: () {
        Navigator.pushNamed(context, '/recipe', arguments: recipe);
        print("Tu as TAPER");
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 8.0,
        child: Row(
          children: [
            Hero(
              tag: "imageRecipe${recipe.title}",
              child: CachedNetworkImage(
                imageUrl: recipe.imageUrl,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ) //else
              ,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      recipe.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text(
                    recipe.user,
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isOnline(String link)
  {
    if(link.substring(0, 4) == "http")
    {
       return true;
    }
    else
    {
      return false;
    }
  }
}
