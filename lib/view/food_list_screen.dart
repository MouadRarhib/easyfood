import 'package:easyfood/controllers/FoodController.dart';
import 'package:easyfood/models/foodModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodController>(
      init: FoodController(), // Initialize your controller
      builder: (_foodController) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Food List'),
          ),
          body: ListView.builder(
            itemCount: _foodController.foods.length,
            itemBuilder: (context, index) {
              final Food food = _foodController.foods[index];
              return ListTile(
                title: Text(food.name),
                subtitle: Text('Price: \$${food.price.toStringAsFixed(2)}'),
                leading: Container(
                  width: 80, // Adjust the width as needed
                  height: 80, // Adjust the height as needed
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(food.imageUrl),
                    ),
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Stars: ${food.stars.toString()}'),
                    Text('Reviews: ${food.reviews.toString()}'),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _foodController.fetchFoods();
            },
            child: Icon(Icons.refresh),
          ),
        );
      },
    );
  }
}
