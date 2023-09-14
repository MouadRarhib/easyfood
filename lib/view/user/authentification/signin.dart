import 'package:easyfood/controllers/AuthController/auth_service.dart';
import 'package:easyfood/controllers/AuthController/user_controller.dart';
import 'package:easyfood/routes/app_page.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/utils/constant.dart';
import 'package:easyfood/utils/custom_button.dart';
import 'package:easyfood/utils/dimention.dart';
import 'package:easyfood/utils/small_text.dart';
import 'package:easyfood/view/user/authentification/signup.dart';
import 'package:easyfood/view/user/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    Get.put(AuthService());
    Get.put(UserController());

    void login() async {
      final email = emailcontroller.text;
      final password = passwordcontroller.text;
      final authService =
          Get.find<AuthService>(); // Get your AuthService instance
      final userController =
          Get.find<UserController>(); // Get your UserController instance

      try {
        // Call the login method from your AuthService
        await authService.login(email, password);

        // After successful login, you can do additional actions such as
        // fetching user data, navigating to the next screen, etc.

        // Example: await userController.getUser(); // Fetch user data
        Get.to(HomeScreen()); // Navigate to the next screen
      } catch (e) {
        // Handle login error (e.g., display an error message)
        print('Login error: $e');
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height,
              child: Positioned.fill(
                child: Image.asset(
                  Constants.background,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  60.verticalSpace,
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
                  BigText(
                    text: 'Sign in to your account ',
                    color: AppColors.titlecolor,
                    size: 19,
                  ).animate().slideY(
                        duration: 300.ms,
                        begin: -1,
                        curve: Curves.easeInSine,
                      ),
                  20.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value as needed
                      border: Border.all(
                        color: Colors.grey, // You can change the border color
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
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value as needed
                      border: Border.all(
                        color: Colors.grey, // You can change the border color
                        width: 2.0, // You can adjust the border width
                      ),
                    ),
                    child: TextField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                    onTap: () => Get.to(() => SignUp()),
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: AppColors.textColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Create here",
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
                      text: 'Login',
                      onTap: login,
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
      ),
    );
  }
}
