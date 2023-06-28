import 'dart:io';

import 'package:azote/recipe.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class RecipeBox {
  static final RecipeBox instance = RecipeBox();

  static Box? box;

  static final List<Recipe> recipes = [
    Recipe(
        "Eru",
        "Toko MIchel",
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        "Faire cuire la viande et commencer la preparation des conjiments \nFaire cuire Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum earum debitis maiores vel aspernatur explicabo quod pariatur excepturi voluptatem aperiam!Reiciendis provident debitis repellat perspiciatis deleniti harum dolore veritatis porro sint praesentium. Ex dolore sequi unde a soluta quas. Numquam.Quibusdam placeat reprehenderit, facere minus facilis modi non nam laborum ullam voluptatibus, quidem dolore cum inventore quos totam iure vitae!Totam nulla consectetur quo iste ab minus pariatur dolorum sapiente velit recusandae explicabo, provident dignissimos, eligendi repellat. Impedit, excepturi quasi.Quo incidunt quia delectus architecto consequatur eligendi ipsa neque dolorem deleniti. Deleniti nobis recusandae provident quod porro blanditiis rerum eum.Earum obcaecati soluta tenetur architecto quod odio amet perspiciatis mollitia reiciendis? Illo repellendus minima iste aspernatur odio at laudantium voluptatibus.Quam rem magnam nihil quia nobis dolorum adipisci cum saepe, dolores commodi vero laudantium eos sint consequuntur! Facilis, dolorum officiis.Repudiandae ratione optio aut aspernatur, rerum dolorem praesentium tempore consectetur architecto repellendus, ullam porro deserunt nulla ipsam, quis perspiciatis. Nam?Aperiam nostrum veritatis ab tempore cum velit, commodi, hic dolores quia maiores obcaecati voluptatum fuga ullam, distinctio placeat quas consequatur?Quis aliquid maiores fugiat dignissimos officia",
        false,
        40),
    Recipe(
        "Okok",
        "Toko MIchel",
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        "Faire cuire la viande et commencer la preparation des conjiments \nFaire cuire Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum earum debitis maiores vel aspernatur explicabo quod pariatur excepturi voluptatem aperiam!Reiciendis provident debitis repellat perspiciatis deleniti harum dolore veritatis porro sint praesentium. Ex dolore sequi unde a soluta quas. Numquam.Quibusdam placeat reprehenderit, facere minus facilis modi non nam laborum ullam voluptatibus, quidem dolore cum inventore quos totam iure vitae!Totam nulla consectetur quo iste ab minus pariatur dolorum sapiente velit recusandae explicabo, provident dignissimos, eligendi repellat. Impedit, excepturi quasi.Quo incidunt quia delectus architecto consequatur eligendi ipsa neque dolorem deleniti. Deleniti nobis recusandae provident quod porro blanditiis rerum eum.Earum obcaecati soluta tenetur architecto quod odio amet perspiciatis mollitia reiciendis? Illo repellendus minima iste aspernatur odio at laudantium voluptatibus.Quam rem magnam nihil quia nobis dolorum adipisci cum saepe, dolores commodi vero laudantium eos sint consequuntur! Facilis, dolorum officiis.Repudiandae ratione optio aut aspernatur, rerum dolorem praesentium tempore consectetur architecto repellendus, ullam porro deserunt nulla ipsam, quis perspiciatis. Nam?Aperiam nostrum veritatis ab tempore cum velit, commodi, hic dolores quia maiores obcaecati voluptatum fuga ullam, distinctio placeat quas consequatur?Quis aliquid maiores fugiat dignissimos officia",
        false,
        40),
    Recipe(
        "Ndole",
        "Toko MIchel",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFTwgohirGRxc69Yuv4nqlu0c-9dSJ-8BCVA&usqp=CAU",
        "Faire cuire la viande et commencer la preparation des conjiments \nFaire cuire Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum earum debitis maiores vel aspernatur explicabo quod pariatur excepturi voluptatem aperiam!Reiciendis provident debitis repellat perspiciatis deleniti harum dolore veritatis porro sint praesentium. Ex dolore sequi unde a soluta quas. Numquam.Quibusdam placeat reprehenderit, facere minus facilis modi non nam laborum ullam voluptatibus, quidem dolore cum inventore quos totam iure vitae!Totam nulla consectetur quo iste ab minus pariatur dolorum sapiente velit recusandae explicabo, provident dignissimos, eligendi repellat. Impedit, excepturi quasi.Quo incidunt quia delectus architecto consequatur eligendi ipsa neque dolorem deleniti. Deleniti nobis recusandae provident quod porro blanditiis rerum eum.Earum obcaecati soluta tenetur architecto quod odio amet perspiciatis mollitia reiciendis? Illo repellendus minima iste aspernatur odio at laudantium voluptatibus.Quam rem magnam nihil quia nobis dolorum adipisci cum saepe, dolores commodi vero laudantium eos sint consequuntur! Facilis, dolorum officiis.Repudiandae ratione optio aut aspernatur, rerum dolorem praesentium tempore consectetur architecto repellendus, ullam porro deserunt nulla ipsam, quis perspiciatis. Nam?Aperiam nostrum veritatis ab tempore cum velit, commodi, hic dolores quia maiores obcaecati voluptatum fuga ullam, distinctio placeat quas consequatur?Quis aliquid maiores fugiat dignissimos officia",
        false,
        40),
    Recipe(
        "Koki",
        "Toko MIchel",
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        "Faire cuire la viande et commencer la preparation des conjiments \nFaire cuire Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum earum debitis maiores vel aspernatur explicabo quod pariatur excepturi voluptatem aperiam!Reiciendis provident debitis repellat perspiciatis deleniti harum dolore veritatis porro sint praesentium. Ex dolore sequi unde a soluta quas. Numquam.Quibusdam placeat reprehenderit, facere minus facilis modi non nam laborum ullam voluptatibus, quidem dolore cum inventore quos totam iure vitae!Totam nulla consectetur quo iste ab minus pariatur dolorum sapiente velit recusandae explicabo, provident dignissimos, eligendi repellat. Impedit, excepturi quasi.Quo incidunt quia delectus architecto consequatur eligendi ipsa neque dolorem deleniti. Deleniti nobis recusandae provident quod porro blanditiis rerum eum.Earum obcaecati soluta tenetur architecto quod odio amet perspiciatis mollitia reiciendis? Illo repellendus minima iste aspernatur odio at laudantium voluptatibus.Quam rem magnam nihil quia nobis dolorum adipisci cum saepe, dolores commodi vero laudantium eos sint consequuntur! Facilis, dolorum officiis.Repudiandae ratione optio aut aspernatur, rerum dolorem praesentium tempore consectetur architecto repellendus, ullam porro deserunt nulla ipsam, quis perspiciatis. Nam?Aperiam nostrum veritatis ab tempore cum velit, commodi, hic dolores quia maiores obcaecati voluptatum fuga ullam, distinctio placeat quas consequatur?Quis aliquid maiores fugiat dignissimos officia",
        false,
        40),
    Recipe(
        "Kondre",
        "Toko MIchel",
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        "Faire cuire la viande et commencer la preparation des conjiments \nFaire cuire Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum earum debitis maiores vel aspernatur explicabo quod pariatur excepturi voluptatem aperiam!Reiciendis provident debitis repellat perspiciatis deleniti harum dolore veritatis porro sint praesentium. Ex dolore sequi unde a soluta quas. Numquam.Quibusdam placeat reprehenderit, facere minus facilis modi non nam laborum ullam voluptatibus, quidem dolore cum inventore quos totam iure vitae!Totam nulla consectetur quo iste ab minus pariatur dolorum sapiente velit recusandae explicabo, provident dignissimos, eligendi repellat. Impedit, excepturi quasi.Quo incidunt quia delectus architecto consequatur eligendi ipsa neque dolorem deleniti. Deleniti nobis recusandae provident quod porro blanditiis rerum eum.Earum obcaecati soluta tenetur architecto quod odio amet perspiciatis mollitia reiciendis? Illo repellendus minima iste aspernatur odio at laudantium voluptatibus.Quam rem magnam nihil quia nobis dolorum adipisci cum saepe, dolores commodi vero laudantium eos sint consequuntur! Facilis, dolorum officiis.Repudiandae ratione optio aut aspernatur, rerum dolorem praesentium tempore consectetur architecto repellendus, ullam porro deserunt nulla ipsam, quis perspiciatis. Nam?Aperiam nostrum veritatis ab tempore cum velit, commodi, hic dolores quia maiores obcaecati voluptatum fuga ullam, distinctio placeat quas consequatur?Quis aliquid maiores fugiat dignissimos officia",
        false,
        40),
    Recipe(
        "Poulet DG",
        "Toko MIchel",
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        "Faire cuire la viande et commencer la preparation des conjiments \nFaire cuire Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum earum debitis maiores vel aspernatur explicabo quod pariatur excepturi voluptatem aperiam!Reiciendis provident debitis repellat perspiciatis deleniti harum dolore veritatis porro sint praesentium. Ex dolore sequi unde a soluta quas. Numquam.Quibusdam placeat reprehenderit, facere minus facilis modi non nam laborum ullam voluptatibus, quidem dolore cum inventore quos totam iure vitae!Totam nulla consectetur quo iste ab minus pariatur dolorum sapiente velit recusandae explicabo, provident dignissimos, eligendi repellat. Impedit, excepturi quasi.Quo incidunt quia delectus architecto consequatur eligendi ipsa neque dolorem deleniti. Deleniti nobis recusandae provident quod porro blanditiis rerum eum.Earum obcaecati soluta tenetur architecto quod odio amet perspiciatis mollitia reiciendis? Illo repellendus minima iste aspernatur odio at laudantium voluptatibus.Quam rem magnam nihil quia nobis dolorum adipisci cum saepe, dolores commodi vero laudantium eos sint consequuntur! Facilis, dolorum officiis.Repudiandae ratione optio aut aspernatur, rerum dolorem praesentium tempore consectetur architecto repellendus, ullam porro deserunt nulla ipsam, quis perspiciatis. Nam?Aperiam nostrum veritatis ab tempore cum velit, commodi, hic dolores quia maiores obcaecati voluptatum fuga ullam, distinctio placeat quas consequatur?Quis aliquid maiores fugiat dignissimos officia",
        false,
        40)
  ];


  
  Future<void> init()
  async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(RecipeAdapter());
    RecipeBox.box = await Hive.openBox("recipeBox");
    // fin de l'initialisation

    var values = RecipeBox.box?.values;

    if(values == null || values.isEmpty)
    {
       RecipeBox.box?.putAll({ for (var e in RecipeBox.recipes) e.key() : e });
    }
  }
}
