import 'package:easyfood/controllers/FoodController.dart';
import 'package:easyfood/models/foodModel.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/utils/dimention.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final FoodController foodController = Get.put(FoodController());

    return Container(
      height: Dimenssion.height30(context) * 5, // Adjust the height as needed
      width: Dimenssion.width30(context) * 15,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodController.foods.length,
        onPageChanged: (index) {
          // Update the current page in the controller
          foodController.setCurrentPage(index);
        },
        itemBuilder: (context, index) {
          var food = foodController.foods[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // Adjust the radius as needed
              child: Image.network(
                food.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
