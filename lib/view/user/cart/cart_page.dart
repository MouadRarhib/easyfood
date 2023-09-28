import 'package:easyfood/controllers/ViewControllers/cartController.dart';
import 'package:easyfood/models/foodModel.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: BigText(
            text: "Your Cart",
            color: AppColors.titlecolor,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Obx(() {
        // Use Obx to automatically update the UI when cart items change
        return ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final foodItem = cartController.cartItems[index];
            return Column(
              children: [
                _buildFoodItemContainer(context, foodItem, cartController),
              ],
            );
          },
        );
      }),
    );
  }

  Widget _buildFoodItemContainer(
      BuildContext context, Food foodItem, CartController cartController) {
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
                            // Remove the item from the cart
                            cartController.removeItem(foodItem);
                          },
                          child: Icon(Icons.delete),
                        ),
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
                          // Implement your logic for adding to cart
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors
                              .titlecolor, // Change this color to the desired color
                        ),
                        child: Text('Buy now'),
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
