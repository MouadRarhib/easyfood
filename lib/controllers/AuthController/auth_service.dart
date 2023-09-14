import 'package:easyfood/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends GetxService {
  var token = ''.obs;

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${Constants.baseUrlauth}/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      token.value = data['token'];
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
}
