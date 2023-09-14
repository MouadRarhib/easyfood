// import 'dart:io';

// import 'package:easyfood/controllers/FoodController.dart';
// import 'package:easyfood/models/foodModel.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:get/get.dart';

// class AddScreen extends StatefulWidget {
//   @override
//   _AddScreenState createState() => _AddScreenState();
// }

// class _AddScreenState extends State<AddScreen> {
//   final FoodController _foodController = Get.put(FoodController());
//   final ImagePicker _imagePicker = ImagePicker();

//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//   TextEditingController _starsController = TextEditingController();
//   TextEditingController _reviewsController = TextEditingController();
//   TextEditingController _streetController = TextEditingController();
//   TextEditingController _cityController = TextEditingController();
//   TextEditingController _countryController = TextEditingController();

//   File? _selectedImage;

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await _imagePicker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }

//   void _addFood() {
//     if (_nameController.text.isNotEmpty && _priceController.text.isNotEmpty) {
//       final Food newFood = Food(
//         id: '', // Generate a unique ID
//         name: _nameController.text,
//         imageUrl: _selectedImage != null ? _selectedImage!.path : '',
//         description: _descriptionController.text,
//         stars: double.parse(_starsController.text),
//         reviews: int.parse(_reviewsController.text),
//         price: double.parse(_priceController.text),
//         street: _streetController.text,
//         city: _cityController.text,
//         country: _countryController.text,
//       );

//       _foodController.createFood(
//         name: newFood.name,
//         imageUrl: newFood.imageUrl,
//         description: newFood.description,
//         stars: newFood.stars,
//         reviews: newFood.reviews,
//         street: newFood.street,
//         city: newFood.city,
//         country: newFood.country,
//         price: newFood.price,
//       );

//       // Navigate back to the previous screen
//       Get.back();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill in all required fields.'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Food'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             InkWell(
//               onTap: _pickImage,
//               child: Container(
//                 height: 200,
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                 ),
//                 child: _selectedImage != null
//                     ? Image.file(
//                         _selectedImage!,
//                         fit: BoxFit.cover,
//                       )
//                     : Center(
//                         child: Icon(Icons.add_a_photo),
//                       ),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Food Name'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _descriptionController,
//               decoration: InputDecoration(labelText: 'Description'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _priceController,
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               decoration: InputDecoration(labelText: 'Price'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _starsController,
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               decoration: InputDecoration(labelText: 'Stars'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _reviewsController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Reviews'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _streetController,
//               decoration: InputDecoration(labelText: 'Street'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _cityController,
//               decoration: InputDecoration(labelText: 'City'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _countryController,
//               decoration: InputDecoration(labelText: 'Country'),
//             ),
//             ElevatedButton(
//               onPressed: _addFood,
//               child: Text('Add Food'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
