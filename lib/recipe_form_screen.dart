import 'dart:math';

import 'package:azote/recipe.dart';
import 'package:azote/recipe_box.dart';
import 'package:flutter/material.dart';

class RecipeFormScreen extends StatefulWidget {
  const RecipeFormScreen({super.key});

  @override
  State<RecipeFormScreen> createState() => _RecipeFormScreenState();
}

class _RecipeFormScreenState extends State<RecipeFormScreen> {
  // ignore: non_constant_identifier_names
  final String IMAGE_URL = "images/eru.jpg";

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final userController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    userController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouvelle Recette"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.8),
              child: TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
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
                controller: descriptionController,
                decoration: const InputDecoration(
                    labelText: "description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
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
                controller: userController,
                decoration: const InputDecoration(
                    labelText: "user name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
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
                    Recipe recipe = Recipe(
                        titleController.text,
                        userController.text,
                        IMAGE_URL,
                        descriptionController.text,
                        false,
                        Random().nextInt(100));

                    RecipeBox.box!.put(recipe.key(), recipe);
                    Navigator.pop(context);
                  }
                },
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newRecipe');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
