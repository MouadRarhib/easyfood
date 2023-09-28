import 'package:easyfood/routes/app_page.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/utils/constant.dart';
import 'package:easyfood/utils/custom_button.dart';
import 'package:easyfood/utils/dimention.dart';
import 'package:easyfood/utils/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Constants.background,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                90.verticalSpace,
                Container(
                  height: Dimenssion.height25(context) * 6,
                  child: Image.asset(
                    Constants.logo,
                    width: Dimenssion.width30(context) * 11,
                    height: Dimenssion.height30(context) * 10,
                    fit: BoxFit.cover,
                  ),
                ).animate().fade().slideY(
                      duration: 300.ms,
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
                50.verticalSpace,
                BigText(
                  text: 'Cook the meal',
                  color: AppColors.titlecolor,
                  size: 25,
                ).animate().slideY(
                      duration: 300.ms,
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
                30.verticalSpace,
                SmallText(
                  text:
                      'Now you have to spend close to an hour battling with spices preparing your meal',
                  size: 14,
                  color: AppColors.titlecolor,
                ).animate().fade().slideY(
                      duration: 300.ms,
                      begin: 1,
                      curve: Curves.easeInSine,
                    ),
                80.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(bottom: 120.w),
                  child: CustomButton(
                    text: 'Shop now',
                    onTap: () => Get.offNamed(Routes.SignIn),
                    isLoading: false,
                  ).animate().fade().slideY(
                        duration: 300.ms,
                        begin: 1,
                        curve: Curves.easeInSine,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
