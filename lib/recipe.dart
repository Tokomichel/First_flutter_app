import 'package:hive/hive.dart';
part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String user;

  @HiveField(2)
  late String imageUrl;

  @HiveField(3)
  late String description;

  @HiveField(4)
  late bool isFavorited;

  @HiveField(5)
  late int favoriteCount;

  Recipe // constructeur de recipe
  (this.title, this.user, this.imageUrl, this.description, this.isFavorited,
      this.favoriteCount);

  String key() => title.hashCode.toString();

  // Map<String, dynamic> toMap() {
  //   return {
  //     'title': title,
  //     'user': user,
  //     'imageUrl': imageUrl,
  //     'description': description,
  //     'isFavorited': isFavorited,
  //     'favoriteCount': favoriteCount
  //   };
  // }

  // factory Recipe.fromMap(Map<String, dynamic> map) => Recipe(
  //    map['title'],
  //    map['user'],
  //    map['imageUrl'],
  //    map['description'],
  //    map['isFavorited'] == 1,
  //    map['favoriteCount']
  //     );
}
