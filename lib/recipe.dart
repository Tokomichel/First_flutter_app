import 'package:azote/favoritechangeNotifier.dart';

class Recipe {
  late String title;
  late String user;
  late String imageUrl;
  late String description;
  late bool isFavorited;
  late int favoriteCount;

  Recipe // constructeur de recipe
  (this.title, this.user, this.imageUrl, this.description, this.isFavorited,
      this.favoriteCount);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'user': user,
      'imageUrl': imageUrl,
      'description': description,
      'isFavorited': isFavorited,
      'favoriteCount': favoriteCount
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) => Recipe(
     map['title'],
     map['user'],
     map['imageUrl'],
     map['description'],
     map['isFavorited'] == 1,
     map['favoriteCount']
      );
}
