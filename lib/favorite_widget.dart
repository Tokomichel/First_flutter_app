import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatefulWidget {
  final bool isFavorited;
  final int favoriteCount;

  const FavoriteIconWidget(
      {Key? cle, required this.favoriteCount, required this.isFavorited})
      : super(key: cle);

  // ignore: library_private_types_in_public_api, annotate_overrides, no_logic_in_create_state
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState(isFavorited, favoriteCount);
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  // ignore: unused_field, prefer_final_fields
  bool _isFavorited ;
  // ignore: unused_field, prefer_final_fields
  int _favoriteCount ;

  _FavoriteIconWidgetState(this._isFavorited, this._favoriteCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          // ignore: prefer_const_constructors
          icon:
              _isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: _toggleFavorite,
        ),
        Text("$_favoriteCount")
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}

// class du texte

class FavoriteTextWidget extends StatefulWidget {
  final bool isFavorited;
  final int favoriteCount;

  const FavoriteTextWidget(
      {Key? cle, required this.favoriteCount, required this.isFavorited})
      : super(key: cle);

  // ignore: library_private_types_in_public_api, annotate_overrides, no_logic_in_create_state
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState(isFavorited, favoriteCount);
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget> {
  // ignore: unused_field, prefer_final_fields
  bool _isFavorited ;
  // ignore: unused_field, prefer_final_fields
  int _favoriteCount ;

  _FavoriteTextWidgetState(this._isFavorited, this._favoriteCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          // ignore: prefer_const_constructors
          icon:
              _isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: _toggleFavorite,
        ),
        Text("$_favoriteCount")
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}
