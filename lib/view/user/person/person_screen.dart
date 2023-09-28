import 'package:easyfood/models/userModel.dart';
import 'package:easyfood/routes/app_page.dart';
import 'package:easyfood/utils/big_text.dart';
import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/utils/constant.dart';
import 'package:easyfood/view/user/person/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:easyfood/controllers/AuthController/auth_service.dart';
import 'package:get/get.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final authService = Get.find<AuthService>(); // Get your AuthService instance
  User? user; // Declare a variable to store the user data
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData(); // Fetch user data when the screen is initialized
  }

  Future<void> fetchUserData() async {
    try {
      final userData = await authService.getUser(); // Fetch user data
      final userFromJson = User.fromJson(userData);
      setState(() {
        user = userFromJson; // Set the user data
      });

      // Set the initial values for name and email controllers
      nameController.text = user?.name ?? '';
      emailController.text = user?.email ?? '';
    } catch (e) {
      // Handle the error if user data cannot be fetched
      print('Error fetching user data: $e');
    }
  }

  Future<void> updateUserProfile() async {
    try {
      // Call the updateUser method from AuthService
      await authService.updateUser(nameController.text, emailController.text);

      // Show a Snackbar to inform the user about the successful update
      Get.snackbar(
        'Profile Updated',
        'Your profile has been updated successfully',
        colorText: AppColors.titlecolor,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    } catch (e) {
      // Handle any errors that occur during the update process
      print('Error updating user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AuthService());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            user != null
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Container(
                              height: height / 4.7,
                              width: width / 2.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                image: DecorationImage(
                                  image: AssetImage(Constants.avatar),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height / 12,
                            width: width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.containerColor,
                            ),
                            child: Center(
                              child: BigText(
                                text: "${user!.name}",
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height / 12,
                            width: width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.containerColor,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Icon(Icons.email_outlined),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 10),
                                  child: BigText(
                                    text: " ${user!.email}",
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height / 12,
                            width: width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.containerColor,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Icon(Icons.phone_android_outlined),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 10),
                                  child: BigText(
                                    text: "${user!.phone}",
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height / 12,
                            width: width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.containerColor,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Icon(Icons.update_rounded),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 10),
                                  child: InkWell(
                                    onTap: () {
                                      // Navigate to the UpdateProfilePage to edit user information
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateProfilePage(
                                            name: user?.name ??
                                                '', // Pass the name from the fetched user data
                                            email: user?.email ??
                                                '', // Pass the email from the fetched user data
                                          ),
                                        ),
                                      );
                                    },
                                    child: BigText(
                                      text: "Update your profile",
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height / 12,
                            width: width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.redAccent,
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () async {
                                  try {
                                    await authService
                                        .logout(); // Call the logout method
                                    // Perform any navigation or state changes after logout
                                    // For example, you can navigate to the login screen
                                    Get.offNamed(Routes.SignIn);
                                  } catch (e) {
                                    // Handle logout error
                                    print('Error during logout: $e');
                                  }
                                },
                                child: BigText(
                                  text: "Logout",
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : CircularProgressIndicator(
                    color: AppColors.titlecolor,
                  ),
          ],
        ),
      ),
    );
  }
}
