import 'dart:math';

import 'package:azote/recipe.dart';
import 'package:azote/recipe_box.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ModifyRecipeScreen extends StatefulWidget {
  ModifyRecipeScreen({super.key, required this.toko});

  Toko toko;

  @override
  State<ModifyRecipeScreen> createState() =>
      // ignore: no_logic_in_create_state
      _ModifyRecipeScreenState(toko);
}

class _ModifyRecipeScreenState extends State<ModifyRecipeScreen> {
  // ignore: non_constant_identifier_names
  final String IMAGE_URL = "images/eru.jpg";

  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var userController = TextEditingController();

  // Recipe recipe;
  // int? index;
  Toko toko;

  _ModifyRecipeScreenState(this.toko);

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    userController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      titleController.text = toko.recipe.title;
      descriptionController.text = toko.recipe.description;
      userController.text = toko.recipe.user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Modifier ${toko.recipe.title}"),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.8),
                child: TextFormField(
                  //initialValue: toko.recipe.title,
                  controller: titleController,
                  decoration: const InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a text";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.8),
                child: TextFormField(
                  //initialValue: toko.recipe.description,
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      labelText: "description",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a text";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.8),
                child: TextFormField(
                  //initialValue: toko.recipe.user,
                  controller: userController,
                  decoration: const InputDecoration(
                      labelText: "user name",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a text";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 8.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      toko.recipe = Recipe(
                          titleController.text,
                          userController.text,
                          IMAGE_URL,
                          descriptionController.text,
                          false,
                          Random().nextInt(100));

                      RecipeBox.box!.putAt(toko.index, toko.recipe);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Save changes"),
                ),
              )
            ],
          ),
        ));
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       Navigator.pushNamed(context, '/modifyRecipe');
    //     },
    //     child: const Icon(Icons.add),
    //   ),
    // );
  }
}

class Toko {
  Toko(this.recipe, this.index);
  Recipe recipe;
  int index;
}
