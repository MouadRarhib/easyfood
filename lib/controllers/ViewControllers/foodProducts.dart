import 'package:easyfood/controllers/FoodController.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/utils/constant.dart';
import 'package:easyfood/utils/small_text.dart';
import 'package:easyfood/view/user/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodProducts extends StatelessWidget {
  const FoodProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backgroundColor,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(Constants.back)),
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: BigText(
                    text: 'Foods',
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GetBuilder<FoodController>(
            init: FoodController(),
            builder: (foodController) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  mainAxisExtent: 214.h,
                ),
                itemCount: foodController.foods.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var foodproducts = foodController.foods[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the DetailsFoodPage and pass the food object as an argument
                      Get.to(
                          DetailsFoodPage(
                            foodproducts:
                                foodproducts, // Pass the food object as an argument
                          ),
                          arguments: foodproducts);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.containerColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              foodproducts.imageUrl,
                              fit: BoxFit.cover,
                              height: 120.0,
                              width: double.infinity,
                            ),
                          ),
                          16.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                SmallText(
                                  text: foodproducts.name,
                                  color: AppColors.textColor,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          10.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                SmallText(
                                  text:
                                      'Price: \$${foodproducts.price.toStringAsFixed(2)}',
                                  color: AppColors.textColor,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
