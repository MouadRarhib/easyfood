import 'package:easyfood/controllers/AuthController/auth_service.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfilePage extends StatefulWidget {
  final String name;
  final String email;

  const UpdateProfilePage({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  Future<void> updateUserProfile() async {
    final authService = Get.find<AuthService>(); // Get AuthService instance
    try {
      // Call the updateUser method from AuthService
      await authService.updateUser(nameController.text, emailController.text);

      // Show a Snackbar or any other feedback to inform the user about the successful update
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profile updated successfully'),
      ));

      // You can also pop the current screen to go back to the previous screen
      Navigator.pop(context);
    } catch (e) {
      // Handle any errors that occur during the update process
      print('Error updating user profile: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize the text controllers with the current user data
    nameController.text = widget.name;
    emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('Update Profile')),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height / 12,
              width: width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.containerColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 30),
            Container(
              height: height / 12,
              width: width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.containerColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 30),
            ElevatedButton(
              onPressed: () {
                // Call the updateUserProfile method in PersonPage
                updateUserProfile();
              },
              child: Text('Update Profile'),
              style: ElevatedButton.styleFrom(
                primary: AppColors
                    .titlecolor, // Change this color to the desired color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
