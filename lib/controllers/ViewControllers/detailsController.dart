import 'package:easyfood/controllers/FoodController.dart';
import 'package:easyfood/controllers/ViewControllers/cartController.dart';
import 'package:easyfood/models/foodModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  Food foodproducts = Get.arguments;

  Rx<Color> selectedColor = Rx<Color>(Colors.red);

  // current screen index
  int currentIndex = 0;

  // to count the number of products in the cart
  int cartItemsCount = 0;

  @override
  void onInit() {
    getCartItemsCount();
    super.onInit();
  }

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    currentIndex = selectedIndex;
    update();
  }

  /// calculate the number of products in the cart
  getCartItemsCount() {
    var foodproduct = FoodController().foods;
    cartItemsCount = foodproduct.fold<int>(0, (p, c) => p + c.quantity);
    update(['CartBadge']);
  }

  /// when the user press on add + icon
  onIncreasePressed(String productId) {
    final foodController = FoodController();
    final foodItem =
        foodController.foods.firstWhereOrNull((p) => p.id == productId);

    if (foodItem != null) {
      foodItem.quantity++;
      getCartItemsCount();
      update(['ProductQuantity']);
    } else {
      // Handle the case where the product with the specified productId was not found.
      // You can show a message or take appropriate action.
      print("Product with ID $productId not found.");
    }
  }

  /// when the user press on remove - icon
  onDecreasePressed(String productId) {
    var product = FoodController().foods.firstWhere((p) => p.id == productId);
    if (product.quantity > 0) {
      product.quantity--;
      getCartItemsCount();
      if (Get.isRegistered<CartController>()) {
        // Get.find<CartController>().getCartProducts();
      }
      update(['ProductQuantity']);
    }
  }

  onAddToCartPressed() {
    if (foodproducts.quantity == 0) {
      onIncreasePressed(foodproducts.id);
    }
    Get.back();
  }
}
