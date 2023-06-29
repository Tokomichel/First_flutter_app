import 'dart:io';
import 'dart:math';

import 'package:azote/recipe.dart';
import 'package:azote/recipe_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  //final String IMAGE_URL = "images/eru.jpg";

  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var userController = TextEditingController();

  File? _file;
  String _imageError = "";
  String imagePath = "";

  // Recipe recipe;
  // int? index;
  Toko toko;

  _ModifyRecipeScreenState(this.toko);

   // ignore: unused_element
   Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        toko.recipe.imageUrl = pickedImage.path;
        _file = File(pickedImage.path);
      });
    }
  }

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
                child: Center(
                  child: Stack(children: [
                    Hero(
                      tag: "imageRecipe${toko.recipe.title}",
                      child: toko.recipe.imageUrl.startsWith("https://") ||
                              toko.recipe.imageUrl.startsWith("http://")
                          ? CachedNetworkImage(
                              imageUrl: toko.recipe.imageUrl,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              width: 250.0,
                              height: 250.0,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              _file != null
                                  ? _file!
                                  : File(toko.recipe.imageUrl),
                              width: 250.0,
                              height: 250.0,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () async {
                          await _pickImage(ImageSource.gallery);
                          setState(() {
                            _imageError = "";
                          });
                        },
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 4,
                  child: Text(
                    _imageError,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              ),
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
                          toko.recipe.imageUrl,
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
