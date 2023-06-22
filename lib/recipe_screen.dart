import 'package:azote/recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_widget.dart';


//       "Faire cuire la viande et commencer la preparation des conjiments \nFaire cuire Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum earum debitis maiores vel aspernatur explicabo quod pariatur excepturi voluptatem aperiam!Reiciendis provident debitis repellat perspiciatis deleniti harum dolore veritatis porro sint praesentium. Ex dolore sequi unde a soluta quas. Numquam.Quibusdam placeat reprehenderit, facere minus facilis modi non nam laborum ullam voluptatibus, quidem dolore cum inventore quos totam iure vitae!Totam nulla consectetur quo iste ab minus pariatur dolorum sapiente velit recusandae explicabo, provident dignissimos, eligendi repellat. Impedit, excepturi quasi.Quo incidunt quia delectus architecto consequatur eligendi ipsa neque dolorem deleniti. Deleniti nobis recusandae provident quod porro blanditiis rerum eum.Earum obcaecati soluta tenetur architecto quod odio amet perspiciatis mollitia reiciendis? Illo repellendus minima iste aspernatur odio at laudantium voluptatibus.Quam rem magnam nihil quia nobis dolorum adipisci cum saepe, dolores commodi vero laudantium eos sint consequuntur! Facilis, dolorum officiis.Repudiandae ratione optio aut aspernatur, rerum dolorem praesentium tempore consectetur architecto repellendus, ullam porro deserunt nulla ipsam, quis perspiciatis. Nam?Aperiam nostrum veritatis ab tempore cum velit, commodi, hic dolores quia maiores obcaecati voluptatum fuga ullam, distinctio placeat quas consequatur?Quis aliquid maiores fugiat dignissimos officia 


// classe de la page Recipe creer par Toko
class RecipeScreen extends StatelessWidget {
  RecipeScreen({super.key, required this.recipe});

  final Recipe recipe;

  Widget description(){ 
    return Container(
    padding: const EdgeInsets.all(32),
    child:  Text(
      recipe.description,
      softWrap: true,
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mes recettes'),
          elevation: 9,
        ),
        body: ListView(
          children: [
            FadeInImage.assetNetwork(
              placeholder: "images/loading-waiting.gif",
              image: recipe.imageUrl, //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn7nTfAtP3HjJD6nMl9VJklVer3CVuTvtTvA&usqp=CAU",
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            recipeTitle(),
            buttonSection(),
            description()
          ],
        ));
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
                  child: const Text(
                    "Eru facile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const Text("Par Toko Michel",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            )),
            Row(
              children: const [
                FavoriteWidget(
                  isFavorited: false,
                  favoriteCount: 40,
                )
              ],
            )
          ],
        ));
  }
}
