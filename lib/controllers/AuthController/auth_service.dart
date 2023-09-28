import 'package:easyfood/controllers/AuthController/api_urls.dart';
import 'package:easyfood/controllers/FoodController.dart';
import 'package:easyfood/models/userModel.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends GetxController {
  // Change GetxService to GetxController
  var token = ''.obs;

  Future<void> login(String email, String password) async {
    print('Base URL before login: ${ApiUrls.baseUrl}');
    final response = await http.post(
      Uri.parse('${Constants.baseUrlauth}/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final tokenValue = data['token']; // Get the token value from the response

      // Print the token value
      print('Token: $tokenValue');

      // Assign the token value to the GetX variable
      token.value = tokenValue;

      // Set the base URL to the Node.js server if logged in
      ApiUrls.setBaseUrl(true);
      print('Base URL set to Node.js server: ${ApiUrls.baseUrl}');

      // Get the FoodController instance and call the fetchFoods method
      final foodController = Get.find<FoodController>();
      await foodController.fetchFoods();

      // Show a Snackbar to welcome the user
      Get.snackbar(
        'Welcome Back',
        'Enjoy your food!', // Customize the welcome message
        colorText: AppColors.titlecolor,
        snackPosition: SnackPosition.BOTTOM, // Set the position of the Snackbar
        duration:
            Duration(seconds: 3), // Set the duration to display the Snackbar
      );
    } else {
      final error = response.body;
      print('Login error: $error');
      throw Exception('Failed to login');
    }
  }

  Future<void> register(
      String name, String email, String phone, String password) async {
    final response = await http.post(
      Uri.parse('${Constants.baseUrlauth}/register'),
      body: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation':
            password, // Assuming you confirm password on the client side
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      token.value = data['token'];
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<Map<String, dynamic>> getUser() async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrlauth}/user'),
      headers: {
        'Authorization': 'Bearer ${token.value}', // Include the auth token
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is Map<String, dynamic>) {
        return data; // Return the user data as a Map
      } else {
        throw Exception('Invalid user data format');
      }
    } else {
      final error = response.body;
      print('Get user error: $error');
      throw Exception('Failed to get user');
    }
  }

  Future<void> logout() async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.baseUrlauth}/logout'),
        headers: {
          'Authorization': 'Bearer ${token.value}',
        },
      );

      if (response.statusCode == 200) {
        // Clear the token on successful logout
        token.value = '';

        // Show a Snackbar to inform the user about successful logout
        Get.snackbar(
          'Logged Out',
          'You have been successfully logged out',
          colorText: AppColors.titlecolor,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );

        // Add any additional cleanup or navigation logic if needed
      } else {
        final error = response.body;
        print('Logout error: $error');
        throw Exception('Failed to logout');
      }
    } catch (e) {
      // Handle logout error
      print('Logout error: $e');
      throw Exception('Failed to logout');
    }
  }

  Future<void> updateUser(String name, String email) async {
    try {
      final uri = Uri.parse('${Constants.baseUrlauth}/user/update');

      final request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] = 'Bearer ${token.value}';
      request.fields['name'] = name;
      request.fields['email'] = email;

      final response = await request.send();

      if (response.statusCode == 200) {
        // Parse the response to get updated user data
        final responseData = await response.stream.bytesToString();
        final userData = json.decode(responseData);

        // Show a Snackbar to inform the user about successful update
        Get.snackbar(
          'Profile Updated',
          'Your profile has been updated successfully',
          colorText: AppColors.titlecolor,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );

        // Update the user data if needed
        // Example: user = User.fromJson(userData);
      } else {
        final error = await response.stream.bytesToString();
        print('Update user error: $error');
        throw Exception('Failed to update user');
      }
    } catch (e) {
      // Handle update error
      print('Update user error: $e');
      throw Exception('Failed to update user');
    }
    update();
  }
}
