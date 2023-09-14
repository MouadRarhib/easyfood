import 'package:easyfood/models/foodModel.dart';
import 'package:easyfood/utils/update_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetailsScreen extends StatelessWidget {
  final Food food;

  FoodDetailsScreen(this.food);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Details'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Container(
            width: 200, // Adjust the width as needed
            height: 100, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(food.imageUrl),
              ),
            ),
          ),
          Text('Name: ${food.name}'),
          Text('Description: ${food.description}'),
          Text('Price: \$${food.price.toStringAsFixed(2)}'),
          Text('Stars: ${food.stars.toString()}'),
          Text('Reviews: ${food.reviews.toString()}'),
          SizedBox(
            height: 50,
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _showUpdateFoodDialog(context, food);
            },
          ),
        ],
      ),
    );
  }

  void _showUpdateFoodDialog(BuildContext context, Food food) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Food'),
          content: SingleChildScrollView(child: UpdateFoodForm(food)),
        );
      },
    );
  }
}
