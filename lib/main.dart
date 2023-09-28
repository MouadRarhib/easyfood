import 'package:easyfood/controllers/AuthController/AuthController.dart';
import 'package:easyfood/controllers/AuthController/auth_service.dart';
import 'package:easyfood/controllers/FoodController.dart';
import 'package:easyfood/controllers/ViewControllers/cartController.dart';
import 'package:easyfood/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  // Wait for bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX
  final authController = Get.put(AuthController()); // Initialize AuthController

  // Declare isLoggedIn as nullable
  bool? isLoggedIn;

  // Perform logic to check if the user is logged in and set the value of isLoggedIn
  // Example:
  // isLoggedIn = await checkIfUserIsLoggedIn();

  // Check if the user is logged in and set the authentication status
  if (isLoggedIn != null) {
    authController.setAuthenticationStatus(isLoggedIn);
  }

  // Initialize your controllers
  Get.lazyPut(() => FoodController());
  Get.lazyPut(() => CartController());
  Get.put(AuthService());

  runApp(ScreenUtilInit(
    designSize: const Size(390, 844),
    minTextAdapt: true,
    splitScreenMode: true,
    useInheritedMediaQuery: true,
    rebuildFactor: (old, data) => true,
    builder: (context, widget) {
      return GetMaterialApp(
        title: 'Ecommerce App',
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    },
  ));
}
