import 'package:azote/favoritechangeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FavoriteIconWidget extends StatefulWidget {
  late bool isFavorited;

  FavoriteIconWidget({super.key});

  // ignore: library_private_types_in_public_api, annotate_overrides, no_logic_in_create_state
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  // ignore: unused_field, prefer_final_fields
  late bool _isFavorited;

  @override
  Widget build(BuildContext context) {
    FavoriteChangeNotifier notifier = Provider.of<FavoriteChangeNotifier>(context);
    _isFavorited = notifier.isFavorited;
    return IconButton(
      // ignore: prefer_const_constructors
      icon: _isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      color: Colors.red,
      onPressed: () => _toggleFavorite(notifier),
    );
  }

  void _toggleFavorite(FavoriteChangeNotifier notifier) {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }

      notifier.isFavorited = _isFavorited;
    });
  }
}

// class du texte

// ignore: must_be_immutable
class FavoriteTextWidget extends StatefulWidget {
  late int favoriteCount;

  FavoriteTextWidget({super.key});

  // ignore: library_private_types_in_public_api, annotate_overrides, no_logic_in_create_state
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState();
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteChangeNotifier>(
      builder: (context, notifier, _) => Text(notifier.favoriteCount.toString())
    );
  }
}
