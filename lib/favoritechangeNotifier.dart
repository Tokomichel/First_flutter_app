// ignore_for_file: unused_field, file_names

import 'package:flutter/foundation.dart';

class FavoriteChangeNotifier with ChangeNotifier {
  bool _isFavorited;
  final int _favoriteCount;

  FavoriteChangeNotifier(this._isFavorited, this._favoriteCount);

  // ignore: unnecessary_getters_setters
  bool get isFavorited => _isFavorited;
  int get favoriteCount => _favoriteCount + (_isFavorited ? 1 : 0);

  set isFavorited(bool isFavorited) {
    _isFavorited = isFavorited;
    notifyListeners();
  }
}
