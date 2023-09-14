import 'package:easyfood/models/foodModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easyfood/controllers/ViewControllers/favouritesController.dart'; // Import the FavouritesController

class FavoriteIconToggle extends StatefulWidget {
  final Food foodItem;

  const FavoriteIconToggle({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  @override
  _FavoriteIconToggleState createState() => _FavoriteIconToggleState();
}

class _FavoriteIconToggleState extends State<FavoriteIconToggle> {
  late final FavouritesController favoritesController;

  @override
  void initState() {
    super.initState();
    favoritesController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FavouritesController());
    final bool isFavorite =
        favoritesController.favoriteItems.contains(widget.foodItem);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isFavorite) {
            favoritesController.removeFromFavorites(widget.foodItem);
          } else {
            favoritesController.addToFavorites(widget.foodItem);
          }
        });
      },
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
        color: Colors.red, // Change the color as needed
        size: 30,
      ),
    );
  }
}
