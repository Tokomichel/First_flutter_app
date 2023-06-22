import 'package:flutter/material.dart';

import 'favorite_widget.dart';



// classe de la page Recipe creer par Toko
class RecipeScreen extends StatelessWidget {

  RecipeScreen({super.key});

  final Widget description = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      "Faire cuire la viande et commencer la preparation des conjiments \nFaire cuire Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum earum debitis maiores vel aspernatur explicabo quod pariatur excepturi voluptatem aperiam!Reiciendis provident debitis repellat perspiciatis deleniti harum dolore veritatis porro sint praesentium. Ex dolore sequi unde a soluta quas. Numquam.Quibusdam placeat reprehenderit, facere minus facilis modi non nam laborum ullam voluptatibus, quidem dolore cum inventore quos totam iure vitae!Totam nulla consectetur quo iste ab minus pariatur dolorum sapiente velit recusandae explicabo, provident dignissimos, eligendi repellat. Impedit, excepturi quasi.Quo incidunt quia delectus architecto consequatur eligendi ipsa neque dolorem deleniti. Deleniti nobis recusandae provident quod porro blanditiis rerum eum.Earum obcaecati soluta tenetur architecto quod odio amet perspiciatis mollitia reiciendis? Illo repellendus minima iste aspernatur odio at laudantium voluptatibus.Quam rem magnam nihil quia nobis dolorum adipisci cum saepe, dolores commodi vero laudantium eos sint consequuntur! Facilis, dolorum officiis.Repudiandae ratione optio aut aspernatur, rerum dolorem praesentium tempore consectetur architecto repellendus, ullam porro deserunt nulla ipsam, quis perspiciatis. Nam?Aperiam nostrum veritatis ab tempore cum velit, commodi, hic dolores quia maiores obcaecati voluptatum fuga ullam, distinctio placeat quas consequatur?Quis aliquid maiores fugiat dignissimos officia sapiente perferendis expedita, fuga ab quidem enim deleniti blanditiis quos autem hic id eaque!Reprehenderit similique minus reiciendis exercitationem. Suscipit necessitatibus commodi assumenda molestiae aperiam placeat ipsa praesentium. Sunt accusamus totam aliquam repellat distinctio?Accusantium quisquam itaque ipsam repellendus exercitationem nulla saepe laboriosam est architecto, praesentium magnam, sed rerum quaerat perspiciatis! Delectus, quod ducimus!Dicta molestias aliquam nihil repudiandae magni, quae fugit velit sed. Dicta quod aperiam ab animi. Hic cupiditate harum esse praesentium.Aperiam amet enim, vero adipisci voluptatibus qui dolorem facere? Incidunt magni iste nostrum sequi debitis delectus similique quae voluptates eum?Commodi eligendi blanditiis voluptatum esse reiciendis aliquam libero aspernatur harum assumenda vel fugiat optio doloremque, voluptate quod modi. Saepe, dolore!Quis, repudiandae omnis amet sed animi dolor itaque consectetur molestiae ipsam error, praesentium soluta eligendi suscipit enim perspiciatis facere reiciendis.At illum, omnis laboriosam fugiat officia recusandae cum voluptatum dolorum quod! Corporis, quos nobis! Ea nam praesentium sed aspernatur magnam!Dolore, dolores adipisci, sapiente nobis quod, ipsa ex illo esse non dicta consectetur consequatur iure a ullam? Harum, ipsa ullam.Exercitationem eligendi error nulla, quod laborum quae quo vel vero repudiandae doloremque optio, ducimus quam atque facilis neque blanditiis iusto?Quaerat, doloremque quisquam modi tempore tenetur labore nobis totam aut cum omnis velit laboriosam repellat alias, eveniet itaque praesentium aperiam.les legume de Okok uiohwurhtuhuiohwruhuiohuwrhuhuh \nhwuhuihuiwhefhhfhuihwehfhuhrhuwhwuihuhuihuiwhuihuih -opqjqp oproopqjpo3jropjpj242rp2pjpj \n uhqeuhuhqheuiohoqjiojiojqeioejiojiofqjeiojiojqeiofjiojiojeiofj \n hqwuihuhquhuihuihuhuhuqefjioj  qjwojopopwe \n uh wfuhhu  ihuihuihqehuihuhqefijioqifjijiqejfiojiojfjqijijaejqefnuinuqncektjkwnuihnauhfbq aebuiwjjrfjiooow \n u9hehhihqethihiohioqehihfheif\njqijeirtj iojerijioj ijerjiej  qe3rjiwggdagheh ijgojopqaPJFFHUIH UHEHRFUIHIuihiogjijrj \n uhqeuhrfuihquihuihejhfhiuqer",
      softWrap: true,
    ),
  );

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
              image:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn7nTfAtP3HjJD6nMl9VJklVer3CVuTvtTvA&usqp=CAU",
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            recipeTitle(),
            buttonSection(),
            description
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
               FavoriteWidget(isFavorited: false, favoriteCount: 40,)
              ],
            )
          ],
        ));
  }
}