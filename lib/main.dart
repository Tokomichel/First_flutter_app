// ignore_for_file: unused_import, unused_element

import 'package:azote/recipe.dart';
import 'package:azote/recipe_box.dart';
import 'package:azote/recipe_form_screen.dart';
import 'package:azote/recipe_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:azote/recipe_screen.dart';

import 'modify_recipe_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RecipeBox.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        // secondaryHeaderColor: Colors.red
      ),

      // RecipeScreen(
      //   recipe: Recipe(
      //      "Eru",
      //      "Toko MIchel",
      //      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn7nTfAtP3HjJD6nMl9VJklVer3CVuTvtTvA&usqp=CAU",
      //      "Faire cuire la viande et commencer la preparation des conjiments \nFaire cuire Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum earum debitis maiores vel aspernatur explicabo quod pariatur excepturi voluptatem aperiam!Reiciendis provident debitis repellat perspiciatis deleniti harum dolore veritatis porro sint praesentium. Ex dolore sequi unde a soluta quas. Numquam.Quibusdam placeat reprehenderit, facere minus facilis modi non nam laborum ullam voluptatibus, quidem dolore cum inventore quos totam iure vitae!Totam nulla consectetur quo iste ab minus pariatur dolorum sapiente velit recusandae explicabo, provident dignissimos, eligendi repellat. Impedit, excepturi quasi.Quo incidunt quia delectus architecto consequatur eligendi ipsa neque dolorem deleniti. Deleniti nobis recusandae provident quod porro blanditiis rerum eum.Earum obcaecati soluta tenetur architecto quod odio amet perspiciatis mollitia reiciendis? Illo repellendus minima iste aspernatur odio at laudantium voluptatibus.Quam rem magnam nihil quia nobis dolorum adipisci cum saepe, dolores commodi vero laudantium eos sint consequuntur! Facilis, dolorum officiis.Repudiandae ratione optio aut aspernatur, rerum dolorem praesentium tempore consectetur architecto repellendus, ullam porro deserunt nulla ipsam, quis perspiciatis. Nam?Aperiam nostrum veritatis ab tempore cum velit, commodi, hic dolores quia maiores obcaecati voluptatum fuga ullam, distinctio placeat quas consequatur?Quis aliquid maiores fugiat dignissimos officia",
      //      false,
      //      40
      //   ),
      // )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 3;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        elevation: 15,
      ),
      body: Center(
        
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tu as appuiyé: ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const RecipeListScreen());
      case '/recipe':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RecipeScreen(recipe: settings.arguments as Recipe),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.ease);
            return FadeTransition(opacity: animation, child: child);
          },
        );

      case '/newRecipe':
        return MaterialPageRoute(
            builder: (context) => const RecipeFormScreen());
 
      case '/modifyRecipe':
        // ignore: avoid_print
        print("On lance la page de modification");
        return MaterialPageRoute(
            builder: (context) =>
                ModifyRecipeScreen(toko: settings.arguments as Toko));

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text("Erreur")),
                  body: const Center(child: Text("Page not found")),
                ));
    }
  }
}
