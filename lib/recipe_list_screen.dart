import 'package:azote/recipe.dart';
// ignore: unused_import
import 'package:azote/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'recipe_database.dart';

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
      appBar: AppBar(title: const Text("Mes recettes")),
      body: FutureBuilder<List<Recipe>>(
          future: RecipeDataBase.instance.test(),
          builder:  (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
            if (snapshot.hasData) {
              List<Recipe> recipes = snapshot.data!;
              return ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];

                    return Dismissible(
                        key: Key(recipe.title),
                        onDismissed: (direction) {
                          setState(() {
                            recipes.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("${recipe.title} supprime")));
                        },
                        background: Container(color: Colors.red),
                        child: RecipeItemWidget(recipe: recipe));
                  });
            }

            else
            {
              return  Text("${snapshot.data}");
            }
          }),
    );
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/recipe', arguments: recipe);
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Hero(
              tag: "recipe ${recipe.title}",
              child: FadeInImage.assetNetwork(
                placeholder: "images/loading-waiting.gif",
                image: recipe
                    .imageUrl, //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn7nTfAtP3HjJD6nMl9VJklVer3CVuTvtTvA&usqp=CAU",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
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
}
