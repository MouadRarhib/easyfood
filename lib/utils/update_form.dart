import 'package:easyfood/controllers/FoodController.dart';
import 'package:easyfood/models/foodModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateFoodForm extends StatefulWidget {
  final Food food;

  UpdateFoodForm(this.food);

  @override
  _UpdateFoodFormState createState() => _UpdateFoodFormState();
}

class _UpdateFoodFormState extends State<UpdateFoodForm> {
  final FoodController _foodController = Get.put(FoodController());

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _starsController = TextEditingController();
  TextEditingController _reviewsController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _descriptionController.text = widget.food.description;
    _priceController.text = widget.food.price.toString();
    _nameController.text = widget.food.name;
    _starsController.text = widget.food.stars.toString();
    _reviewsController.text = widget.food.reviews.toString();
    _streetController.text = widget.food.street;
    _cityController.text = widget.food.city;
    _countryController.text = widget.food.country;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _descriptionController,
          decoration: InputDecoration(labelText: 'Description'),
        ),
        TextField(
          controller: _priceController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(labelText: 'Price'),
        ),
        TextField(
          controller: _starsController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(labelText: 'Stars'),
        ),
        TextField(
          controller: _reviewsController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Reviews'),
        ),
        TextField(
          controller: _streetController,
          decoration: InputDecoration(labelText: 'Street'),
        ),
        TextField(
          controller: _cityController,
          decoration: InputDecoration(labelText: 'City'),
        ),
        TextField(
          controller: _countryController,
          decoration: InputDecoration(labelText: 'Country'),
        ),
        ElevatedButton(
          onPressed: () {
            _foodController.updateFood(
              _nameController.text,
              imageUrl: widget.food.imageUrl,
              stars: double.parse(_starsController.text),
              reviews: int.parse(_reviewsController.text),
              street: _streetController.text,
              city: _cityController.text,
              country: _countryController.text,
              description: _descriptionController.text,
              price: double.parse(_priceController.text),
            );
            Navigator.pop(context); // Close the dialog
          },
          child: Text('Update Food'),
        ),
      ],
    );
  }
}
