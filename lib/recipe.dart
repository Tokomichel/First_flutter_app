class Recipe {
  late String title;
  late String user;
  late String imageUrl;
  late String description;
  late bool isFavorited;
  late int favoriteCVount;

  Recipe // constructeur de recipe
  (this.title, this.user, this.imageUrl, this.description, this.isFavorited,
      this.favoriteCVount);
}