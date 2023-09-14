import 'package:easyfood/controllers/ViewControllers/cartController.dart';
import 'package:easyfood/controllers/ViewControllers/favouritesController.dart';

import 'package:easyfood/routes/app_page.dart';
import 'package:easyfood/utils/ItemsCounter.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/utils/constant.dart';
import 'package:easyfood/utils/is_favourite.dart';
import 'package:easyfood/utils/small_text.dart';
import 'package:easyfood/view/user/cart/cart_page.dart';
import 'package:easyfood/view/user/favourites/favourites.dart';
import 'package:flutter/material.dart';
import 'package:easyfood/models/foodModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:get/get.dart';

class DetailsFoodPage extends StatelessWidget {
  final Food foodproducts;
  final Food selectedFood;

  int quantity = 0;
  DetailsFoodPage({
    required this.foodproducts,
  }) : selectedFood = foodproducts;

  bool isDescriptionExpanded = false;
  void addToCart() {
    Get.put(CartController());
    final cartController = Get.find<CartController>();
    cartController.addToCart(foodproducts); // Pass the selected food item
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Get.put(FavouritesController());

    Get.put(CartController());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      Constants.back,
                      height: 80,
                      width: 50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => CartPage()),
                    child: Image.asset(
                      Constants.cart,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              // Food picture
              Container(
                height: height / 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(foodproducts.imageUrl),
                  ),
                ),
              ),
              //Food name
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: BigText(
                    text: foodproducts.name,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // stars reviews favourites
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.titlecolor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Constants.star,
                              height: 20,
                              width: 20,
                            ),
                            5.horizontalSpace,
                            SmallText(
                              text: '${foodproducts.stars.toString()}',
                              size: 18,
                              color: AppColors.containerColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BigText(
                      text: 'Reviews:  ( ${foodproducts.reviews.toString()})',
                      size: 15,
                      color: AppColors.textColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FavoriteIconToggle(
                      foodItem: foodproducts,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 25),

              BigText(
                text: 'Description:',
                color: AppColors.textColor,
              ),
              SizedBox(height: 8),
              //Description
              ExpandableText(
                foodproducts.description,
                style: TextStyle(fontSize: 16, color: AppColors.titlecolor),
                linkColor: AppColors.containerColor,
                expandText: 'Show More',
                collapseText: 'Show Less',
                maxLines: 2, // Show the first two lines
                expanded: isDescriptionExpanded,

                onPrefixTap: () {
                  // This part remains the same
                  // ...
                },
              ),
              SizedBox(height: height / 10),

              // Quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemsCounter(
                    foodItem: selectedFood,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => Favourites()),
                    child: Text("add"),
                  )
                ],
              ),

              SizedBox(height: height / 60),
              // Add to cart container
              Container(
                height: height / 9,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.titlecolor,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 40),
                      child: Column(
                        children: [
                          SmallText(
                            text: "Total price",
                            color: AppColors.containerColor,
                            size: 15,
                          ),
                          BigText(
                            text:
                                '\$${(foodproducts.price.toString())}', // Calculate total price based on quantity
                            color: AppColors.containerColor,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 50),
                      child: GestureDetector(
                        onTap: addToCart,
                        child: Container(
                          height: height / 13,
                          width: width / 2.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.containerColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: "Add to cart",
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
