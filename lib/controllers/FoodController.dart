import 'package:easyfood/models/foodModel.dart';
import 'package:easyfood/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodController extends GetxController {
  List<Food> foods = [];

  final RxInt currentPage = 0.obs;
  var cards = [Constants.card1, Constants.card2, Constants.card3];

  @override
  void onInit() {
    super.onInit();
    print("Initializing FoodController");
    fetchFoods(); // Fetch data when the controller initializes
  }

  Future<void> fetchFoods() async {
    try {
      final response = await http.get(Uri.parse('${Constants.baseUrl}/getall'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        foods = responseData.map((data) => Food.fromJson(data)).toList();
        update();
        print('Foods fetched successfully: $foods'); // Print the fetched foods
      } else {
        print('Failed to fetch foods. Status code: ${response.statusCode}');
        // Handle the error or implement retry logic
      }
    } catch (error) {
      print('Error fetching foods: $error');
      // Handle the error
    }
  }

  Future<void> createFood({
    required String name,
    required String imageUrl,
    required String description,
    required double stars,
    required int reviews,
    required String street,
    required String city,
    required String country,
    required double price,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.baseUrl}/create'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'imageUrl': imageUrl,
        'description': description,
        'stars': stars,
        'reviews': reviews,
        'street': street,
        'city': city,
        'country': country,
        'price': price,
      }),
    );

    print('Request Body: ${json.encode({
          'name': name,
          'imageUrl': imageUrl,
          'description': description,
          'stars': stars,
          'reviews': reviews,
          'street': street,
          'city': city,
          'country': country,
          'price': price,
        })}');

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      fetchFoods(); // Refresh the list after adding
    } else {
      throw Exception('Failed to create food');
    }
  }

  Future<void> updateFood(
    String name, {
    required String imageUrl,
    required String description,
    required double stars,
    required int reviews,
    required String street,
    required String city,
    required String country,
    required double price,
  }) async {
    final response = await http.put(
      Uri.parse('${Constants.baseUrl}/update/$name'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'imageUrl': imageUrl,
        'description': description,
        'stars': stars,
        'reviews': reviews,
        'street': street,
        'city': city,
        'country': country,
        'price': price,
      }),
    );

    if (response.statusCode == 200) {
      fetchFoods(); // Refresh the list after updating
    } else {
      throw Exception('Failed to update food');
    }
  }

  Future<void> deleteFood(String name) async {
    final response =
        await http.delete(Uri.parse('${Constants.baseUrl}/delete/$name'));

    if (response.statusCode == 200) {
      fetchFoods(); // Refresh the list after deleting
    } else {
      throw Exception('Failed to delete food');
    }
  }

  void setCurrentPage(int index) {
    currentPage.value = index;
  }
}
