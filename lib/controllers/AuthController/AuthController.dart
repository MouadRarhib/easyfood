import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isAuthenticated = false.obs;

  void setAuthenticationStatus(bool status) {
    isAuthenticated.value = status;
  }
}
