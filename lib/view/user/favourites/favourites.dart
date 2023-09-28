import 'package:easyfood/controllers/ViewControllers/cartController.dart';
import 'package:easyfood/controllers/ViewControllers/favouritesController.dart';
import 'package:easyfood/models/foodModel.dart'; // Import your Food model
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Favourites extends StatelessWidget {
  final FavouritesController favoritesController =
      Get.put(FavouritesController());

  Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: BigText(
          text: "Your favourites",
          color: AppColors.titlecolor,
        )),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: GetBuilder<FavouritesController>(
        builder: (controller) {
          // Use GetBuilder to automatically update the UI when favorite items change
          final favoriteItems = controller.favoriteItems;

          if (favoriteItems.isEmpty) {
            return Center(
              child: Text('No favorite items.'),
            );
          } else {
            return ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final foodItem = favoriteItems[index];
                return Column(
                  children: [
                    _buildFoodItemContainer(context, foodItem, controller),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildFoodItemContainer(
      BuildContext context, Food foodItem, FavouritesController controller) {
    final CartController cartController = Get.find<CartController>();
    return Column(
      children: [
        20.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.containerColor, // Customize the background color
            borderRadius:
                BorderRadius.circular(10.0), // Customize the border radius
            boxShadow: [
              BoxShadow(
                color: AppColors.titlecolor,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        foodItem.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              // Remove the item from favorites
                              controller.removeFromFavorites(foodItem);
                            },
                            child: Icon(Icons.delete)),
                      )
                    ],
                  ),
                  // Add other item details here (e.g., description, price)

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: '\$${(foodItem.price.toString())}',
                        color: AppColors.textColor,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cartController.addToCart(foodItem);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors
                              .titlecolor, // Change this color to the desired color
                        ),
                        child: Text('Add to Cart'),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
