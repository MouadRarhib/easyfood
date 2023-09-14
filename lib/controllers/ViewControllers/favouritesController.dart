import 'dart:convert';

import 'package:easyfood/models/foodModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesController extends GetxController {
  RxList<Food> favoriteItems = <Food>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load favorite items from SharedPreferences when the controller is initialized
    loadFavoriteItems();
  }

  void addToFavorites(Food food) {
    favoriteItems.add(food);
    saveFavoriteItems();
  }

  void removeFromFavorites(Food food) {
    favoriteItems.remove(food);
    saveFavoriteItems();
  }

  void saveFavoriteItems() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteItemsJson =
        favoriteItems.map((food) => food.toJson()).toList();
    await prefs.setString('favoriteItems', jsonEncode(favoriteItemsJson));
  }

  void loadFavoriteItems() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteItemsJson = prefs.getString('favoriteItems');
    if (favoriteItemsJson != null) {
      final List<dynamic> decoded = jsonDecode(favoriteItemsJson);
      favoriteItems.assignAll(decoded.map((item) => Food.fromJson(item)));
    }
  }
}
