import 'dart:math';

import 'package:easyfood/models/foodModel.dart';
import 'package:easyfood/routes/app_page.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/utils/constant.dart';
import 'package:easyfood/utils/custom_form_field.dart';
import 'package:easyfood/utils/small_text.dart';
import 'package:easyfood/view/user/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:easyfood/controllers/FoodController.dart'; // Import your FoodController

class HomeScreen extends StatelessWidget {
  final FoodController foodController = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    foodController.fetchFoods();

    final Food foodproducts;
    Get.put(FoodController());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cards = [Constants.card1, Constants.card2, Constants.card3];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(children: [
        Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
              title: SmallText(
                text: "Good morning",
                color: AppColors.titlecolor,
              ),
              subtitle: BigText(
                text: "Hello Jhon !",
                color: AppColors.textColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomFormField(
                  backgroundColor: Colors.white,
                  textSize: 14.sp,
                  hint: 'Search food',
                  hintFontSize: 14.sp,
                  hintColor: AppColors.textColor,
                  maxLines: 1,
                  borderRound: 60.r,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  focusedBorderColor: Colors.white,
                  isSearchField: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: AppColors.titlecolor,
                  )),
            ),
            Container(
              width: width,
              height: height / 4.h,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  initialPage: 1,
                  viewportFraction: 0.9,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  height: 200,
                ),
                itemCount: cards.length,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return Image.asset(
                    cards[itemIndex],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: "Our categories",
                    color: AppColors.textColor,
                    size: 25,
                  ),
                ],
              ),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Constants.foodsIcon,
                          ),
                        ],
                      ),
                      BigText(
                        text: "Foods",
                        color: AppColors.textColor,
                        size: 20,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Constants.drinksIcon,
                          ),
                        ],
                      ),
                      BigText(
                        text: "Drinks",
                        color: AppColors.textColor,
                        size: 20,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Constants.dessertsIcon,
                          ),
                        ],
                      ),
                      BigText(
                        text: "Desserts",
                        color: AppColors.textColor,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: "Best selling",
                    color: AppColors.textColor,
                  ),
                  InkWell(
                    onTap: () {},
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.PRODUCTS),
                      child: BigText(
                        text: "See all",
                        color: AppColors.titlecolor,
                      ),
                    ),
                  )
                ],
              ),
              16.verticalSpace,
              GetBuilder<FoodController>(
                init: FoodController(),
                builder: (foodController) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemCount: min(2, foodController.foods.length),
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
                                  height: 100.0,
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
              )
            ],
          ),
        )
      ]),
    );
  }
}
