import 'package:flutter/material.dart';
import 'package:movie_app_new/models/movie/index.dart';

class CommonProvider extends ChangeNotifier {
  List<MovieModel> movies = [];
  List<int> wishListIds = [];
  int currentIdx = 0;
  bool isLoggedIn = false;

  void setMovies(List<MovieModel> data) {
    movies = data;
    notifyListeners();
  }

  void addWishList(int id) {
    if (wishListIds.contains(id)) {
      wishListIds.remove(id);
    } else {
      wishListIds.add(id);
    }
    notifyListeners();
  }

  void changeCurrentIdx(int idx) {
    currentIdx = idx;
    notifyListeners();
  }

  void onLogin() {
    isLoggedIn = true;
    notifyListeners();
  }

  void onLogout() {
    isLoggedIn = false;
    notifyListeners();
  }
}
