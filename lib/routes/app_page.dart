import 'package:easyfood/controllers/ViewControllers/foodProducts.dart';
import 'package:easyfood/models/foodModel.dart';
import 'package:easyfood/view/admin/Food_crud.dart';
import 'package:easyfood/view/user/authentification/signin.dart';
import 'package:easyfood/view/user/cart/cart_page.dart';
import 'package:easyfood/view/user/details/details_page.dart';
import 'package:easyfood/view/user/home/HomeScreen.dart';
import 'package:easyfood/view/user/splash/Binding.dart';
import 'package:easyfood/view/user/splash/SplashScreen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => const FoodProducts(),
    ),
    GetPage(
      name: _Paths.SignIn,
      page: () => const SignIn(),
    ),
  ];
}
