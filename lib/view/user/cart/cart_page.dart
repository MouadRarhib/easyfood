import 'package:easyfood/controllers/ViewControllers/cartController.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());

    return Scaffold(
      body: Column(
        children: [
          // Add a Text widget for the title
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: BigText(
              text: "Your Cart",
              color: AppColors.titlecolor,
              size: 24, // You can adjust the font size as needed
            ),
          ),
          Expanded(
            child: Obx(() {
              // Use Obx to automatically update the UI when cart items change
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final foodItem = cartController.cartItems[index];
                  return ListTile(
                    title: Text(foodItem.name),
                    subtitle: Text('Quantity: ${foodItem.quantity}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Remove the item when the delete button is pressed
                        cartController.removeItem(foodItem);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
