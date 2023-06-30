import 'dart:io';

import 'package:azote/recipe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_widget.dart';
import 'favoritechangeNotifier.dart';


//       "Faire cuire la viande et commencer la preparation des conjiments \nFaire cuire Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum earum debitis maiores vel aspernatur explicabo quod pariatur excepturi voluptatem aperiam!Reiciendis provident debitis repellat perspiciatis deleniti harum dolore veritatis porro sint praesentium. Ex dolore sequi unde a soluta quas. Numquam.Quibusdam placeat reprehenderit, facere minus facilis modi non nam laborum ullam voluptatibus, quidem dolore cum inventore quos totam iure vitae!Totam nulla consectetur quo iste ab minus pariatur dolorum sapiente velit recusandae explicabo, provident dignissimos, eligendi repellat. Impedit, excepturi quasi.Quo incidunt quia delectus architecto consequatur eligendi ipsa neque dolorem deleniti. Deleniti nobis recusandae provident quod porro blanditiis rerum eum.Earum obcaecati soluta tenetur architecto quod odio amet perspiciatis mollitia reiciendis? Illo repellendus minima iste aspernatur odio at laudantium voluptatibus.Quam rem magnam nihil quia nobis dolorum adipisci cum saepe, dolores commodi vero laudantium eos sint consequuntur! Facilis, dolorum officiis.Repudiandae ratione optio aut aspernatur, rerum dolorem praesentium tempore consectetur architecto repellendus, ullam porro deserunt nulla ipsam, quis perspiciatis. Nam?Aperiam nostrum veritatis ab tempore cum velit, commodi, hic dolores quia maiores obcaecati voluptatum fuga ullam, distinctio placeat quas consequatur?Quis aliquid maiores fugiat dignissimos officia

// classe de la page Recipe creer par Toko
class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key, required this.recipe});

  final Recipe recipe;

  Widget description() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        recipe.description,
        softWrap: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteChangeNotifier(recipe),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Mes recettes'),
            elevation: 9,
          ),
          body: ListView(
            children: [
              Hero(
                tag: "recipe ${recipe.title
                
                
                }",
                child: recipe.imageUrl.startsWith("https://") ||
                              recipe.imageUrl.startsWith("http://")
                          ? CachedNetworkImage(
                              imageUrl: recipe.imageUrl,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              width: 250.0,
                              height: 250.0,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                             File(recipe.imageUrl),
                              width: 250.0,
                              height: 250.0,
                              fit: BoxFit.cover,
                            ),//else,
              ),
              recipeTitle(),
              buttonSection(),
              description()
            ],
          )),
    );
  }

  Widget buttonSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBuildColum(Colors.lightBlue, Icons.comment, "Comment"),
        _buildBuildColum(Colors.lightBlue, Icons.share, "Share")
      ],
    );
  }

  Column _buildBuildColum(Color color, IconData icon, String label) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Icon(
              icon,
              color: color,
              size: 35,
            )),
        Text(
          label,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.lightBlue),
        )
      ],
    );
  }

  Widget recipeTitle() {
    String nom = recipe.user;

    return Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 6),
                  child:  Text(
                    recipe.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                 Text("Par $nom",
                    style: const TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            )),
            
            FavoriteIconWidget(),
            FavoriteTextWidget()
            ],
            
          
        ));
  }
}
