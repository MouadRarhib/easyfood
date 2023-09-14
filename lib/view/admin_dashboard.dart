import 'package:easyfood/controllers/FoodController.dart';
import 'package:easyfood/models/foodModel.dart';
import 'package:easyfood/view/admin/Food_crud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  final FoodController _foodController = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _foodController.foods.length,
          itemBuilder: (context, index) {
            final Food food = _foodController.foods[index];
            return ListTile(
              title: Text(food.name),
              subtitle: Text('Price: \$${food.price.toStringAsFixed(2)}'),
              leading: Container(
                width: 80, // Adjust the width as needed
                height: 100, // Adjust the height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(food.imageUrl),
                  ),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 20, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Stars: ${food.stars.toString()}'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Reviews: ${food.reviews.toString()}'),
                    // IconButton(
                    //   icon: Icon(Icons.edit),
                    //   onPressed: () {
                    //     _showUpdateFoodDialog(context, food);
                    //   },
                    // ),
                  ],
                ),
              ),
              onTap: () {
                _showFoodDetails(context, food);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new food
          // _showAddFoodDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showFoodDetails(BuildContext context, Food food) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsScreen(food),
      ),
    );
  }
}
