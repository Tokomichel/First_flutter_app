import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  final bool isFavorited;
  final int favoriteCount;

  const FavoriteWidget(
      {Key? cle, required this.favoriteCount, required this.isFavorited})
      : super(key: cle);

  // ignore: library_private_types_in_public_api, annotate_overrides, no_logic_in_create_state
  _FavoriteWidgetState createState() => _FavoriteWidgetState(isFavorited, favoriteCount);
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  // ignore: unused_field, prefer_final_fields
  bool _isFavorited ;
  // ignore: unused_field, prefer_final_fields
  int _favoriteCount ;

  _FavoriteWidgetState(this._isFavorited, this._favoriteCount);

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
