import 'package:easyfood/controllers/AuthController/auth_service.dart';
import 'package:easyfood/controllers/AuthController/user_controller.dart';
import 'package:easyfood/routes/app_page.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/utils/constant.dart';
import 'package:easyfood/utils/custom_button.dart';
import 'package:easyfood/utils/dimention.dart';
import 'package:easyfood/utils/small_text.dart';
import 'package:easyfood/view/user/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController namecontroller = TextEditingController();
    TextEditingController phonecontroller = TextEditingController();
    final authService =
        Get.find<AuthService>(); // Get your AuthService instance
    final userController =
        Get.find<UserController>(); // Get your UserController instance

    void register() async {
      final email = emailcontroller.text;
      final password = passwordcontroller.text;
      final name = namecontroller.text;
      final phone = phonecontroller.text;

      try {
        // Call the register method from your AuthService
        await authService.register(name, email, phone, password);
        // Optionally, you can navigate to the next screen after successful registration.
        Get.offNamed(Routes.NavBar);
      } catch (e) {
        // Handle registration error (e.g., display an error message)
        print('Registration error: $e');
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                50.verticalSpace,
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
                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the value as needed
                    border: Border.all(
                      color: AppColors
                          .textColor, // You can change the border color
                      width: 2.0, // You can adjust the border width
                    ),
                  ),
                  child: Container(
                    width: 300,
                    child: TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: AppColors
                              .textColor, // Change the color to your desired color
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 30.0), // Optional padding
                        border: InputBorder
                            .none, // Remove the default TextField border
                      ),
                      cursorColor: AppColors.backgroundColor,
                    ),
                  ),
                ).animate().slideY(
                      duration: 300.ms,
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the value as needed
                    border: Border.all(
                      color: AppColors
                          .textColor, // You can change the border color
                      width: 2.0, // You can adjust the border width
                    ),
                  ),
                  child: TextField(
                    controller:
                        passwordcontroller, // Use the password controller
                    obscureText: true, // Hide the password
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: AppColors.textColor,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                      ),
                      border: InputBorder.none,
                    ),
                    cursorColor: AppColors.backgroundColor,
                  ),
                ).animate().slideY(
                      duration: 300.ms,
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the value as needed
                    border: Border.all(
                      color: AppColors
                          .textColor, // You can change the border color
                      width: 2.0, // You can adjust the border width
                    ),
                  ),
                  child: TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: AppColors
                            .textColor, // Change the color to your desired color
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 30.0), // Optional padding
                      border: InputBorder
                          .none, // Remove the default TextField border
                    ),
                    cursorColor: AppColors.backgroundColor,
                  ),
                ).animate().slideY(
                      duration: 300.ms,
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the value as needed
                    border: Border.all(
                      color: AppColors
                          .textColor, // You can change the border color
                      width: 2.0, // You can adjust the border width
                    ),
                  ),
                  child: TextField(
                    controller: phonecontroller,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      labelStyle: TextStyle(
                        color: AppColors
                            .textColor, // Change the color to your desired color
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 30.0), // Optional padding
                      border: InputBorder
                          .none, // Remove the default TextField border
                    ),
                    cursorColor: AppColors.backgroundColor,
                  ),
                ).animate().slideY(
                      duration: 300.ms,
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
                10.verticalSpace,
                InkWell(
                  onTap: () => Get.back(),
                  child: RichText(
                    text: TextSpan(
                      text: "Have an account already? ",
                      style: TextStyle(
                        color: AppColors.textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                30.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(bottom: 120.w),
                  child: CustomButton(
                    text: 'Register',
                    onTap: register,
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
    ;
  }
}
