import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easyfood/models/foodModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Food> cartItems = <Food>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load cart items from SharedPreferences when the controller is initialized
    loadCartItems();
  }

  void increment(Food food) {
    final existingItemIndex =
        cartItems.indexWhere((item) => item.id == food.id);

    if (existingItemIndex != -1) {
      // If the item is already in the cart, just increment its quantity
      cartItems[existingItemIndex].quantity++;
    } else {
      // If the item is not in the cart, add it with a quantity of 1

      cartItems.add(food);
    }

    saveCartItems();
    update(); // Notify listeners
  }

  void decrement(Food food) {
    final existingItemIndex =
        cartItems.indexWhere((item) => item.id == food.id);

    if (existingItemIndex != -1) {
      if (cartItems[existingItemIndex].quantity > 1) {
        cartItems[existingItemIndex].quantity -= 1;
      } else {
        cartItems.removeAt(existingItemIndex);
      }
      saveCartItems();
      update(); // Notify listeners
    }
  }

  void addToCart(Food food) {
    final existingItemIndex =
        cartItems.indexWhere((item) => item.id == food.id);

    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity += 1;
    } else {
      food.quantity = 1;
      cartItems.add(food);
    }

    saveCartItems(); // Save the updated cart items

    // Show a Snackbar
    final snackBar = SnackBar(
      content: Text('${food.name} added to cart'),
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );

    // Find the ScaffoldMessenger and show the Snackbar
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  void saveCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItemsJson = cartItems.map((food) => food.toJson()).toList();
    await prefs.setString('cartItems', jsonEncode(cartItemsJson));
  }

  void loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItemsJson = prefs.getString('cartItems');
    if (cartItemsJson != null) {
      final List<dynamic> decoded = jsonDecode(cartItemsJson);
      cartItems.assignAll(decoded.map((item) => Food.fromJson(item)));
    }
  }

  void removeItem(Food food) {
    cartItems.remove(food); // Remove the item from the cart
    saveCartItems(); // Save the updated cart items
  }
}
