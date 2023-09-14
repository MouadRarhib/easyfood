import 'package:easyfood/controllers/ViewControllers/cartController.dart';
import 'package:easyfood/models/foodModel.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsCounter extends StatelessWidget {
  final Food foodItem;

  const ItemsCounter({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final CartController cartController = Get.find();
    return Container(
      height: height / 15,
      width: width / 2.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.containerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: width / 40),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              cartController.decrement(foodItem);
            },
          ),
          GetBuilder<CartController>(
            builder: (cartController) {
              final item = cartController.cartItems.firstWhere(
                  (item) => item.id == foodItem.id,
                  orElse: () => foodItem);
              return Text("Quantity: ${item.quantity}");
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              cartController.increment(foodItem);
            },
          ),
          SizedBox(width: width / 40),
        ],
      ),
    );
  }
}
