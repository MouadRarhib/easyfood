import 'package:easyfood/controllers/ViewControllers/favouritesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavouritesController favoritesController =
        Get.put(FavouritesController());

    return Scaffold(
      body: Obx(() {
        // Use Obx to automatically update the UI when favorite items change
        final favoriteItems = favoritesController.favoriteItems;

        if (favoriteItems.isEmpty) {
          return Center(
            child: Text('No favorite items.'),
          );
        } else {
          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final foodItem = favoriteItems[index];
              return ListTile(
                title: Text(foodItem.name),
                // ... (other item details)
              );
            },
          );
        }
      }),
    );
  }
}
