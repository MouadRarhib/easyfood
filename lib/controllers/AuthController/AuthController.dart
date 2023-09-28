import 'package:easyfood/controllers/AuthController/api_urls.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isLoggedIn = false;
  RxBool isAuthenticated = false.obs;

  void setAuthenticationStatus(bool status) {
    isAuthenticated.value = status;
  }

  void login() {
    // Your login logic here
    isLoggedIn = true; // Set the user as logged in
    ApiUrls.setBaseUrl(isLoggedIn); // Switch base URL
    update(); // Update the GetX controller
  }

  void logout() {
    // Your logout logic here
    isLoggedIn = false; // Set the user as logged out
    ApiUrls.setBaseUrl(isLoggedIn); // Switch base URL
    update(); // Update the GetX controller
  }
}
