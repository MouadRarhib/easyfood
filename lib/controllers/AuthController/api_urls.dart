import 'package:easyfood/utils/constant.dart';

class ApiUrls {
  // Default to the Laravel server URL
  static String baseUrl = Constants.baseUrlauth;

  // Method to set the base URL based on login status
  static void setBaseUrl(bool isLoggedIn) {
    if (isLoggedIn) {
      baseUrl = Constants.baseUrl; // Use the Node.js server URL
      print('Base URL set to Node.js server: $baseUrl');
    } else {
      baseUrl = Constants.baseUrlauth; // Use the Laravel server URL
      print('Base URL set to Laravel server: $baseUrl');
    }
  }
}
