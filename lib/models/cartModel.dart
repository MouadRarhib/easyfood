import 'package:easyfood/models/foodModel.dart';

class CartItem {
  final Food food;
  int quantity;

  CartItem({
    required this.food,
    this.quantity = 0,
  });

  // Ensure quantity is always positive
  void setQuantity(int value) {
    if (value >= 0) {
      quantity = value;
    }
  }
}
