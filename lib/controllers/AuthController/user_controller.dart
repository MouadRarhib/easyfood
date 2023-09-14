import 'package:easyfood/controllers/AuthController/auth_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final authService = Get.find<AuthService>();

  Future<void> getUser() async {
    // Implement the logic to get user data from your Laravel backend here
    // You can use the token stored in authService.token to authenticate the request
  }

  Future<void> updateProfile(String name, String email, dynamic image) async {
    // Implement the logic to update the user's profile on your Laravel backend here
    // You can use the token stored in authService.token to authenticate the request
  }

  Future<void> logout() async {
    // Implement the logic to log out the user on your Laravel backend here
    // You can use the token stored in authService.token to authenticate the request
  }
}
