import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/utils/constant.dart';
import 'package:easyfood/utils/dimention.dart';
import 'package:easyfood/view/user/splash/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> navigateToWelcomeScreen() async {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeView()),
      );
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Constants.background,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 150.w),
          child: Column(
            children: [
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  curve: Curves.easeInSine,
                  transform: Matrix4.translationValues(0.0, 1.0, 0.0),
                  child: GestureDetector(
                    onTap: navigateToWelcomeScreen, // Navigate when tapped
                    child: Container(
                      height: Dimenssion.height25(context) * 6,
                      child: Image.asset(
                        Constants.logo,
                        width: Dimenssion.width30(context) * 11,
                        height: Dimenssion.height30(context) * 10,
                        fit: BoxFit.cover,
                      ),
                    ).animate().fade().slideY(
                        duration: 600.ms, begin: 1, curve: Curves.easeInSine),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
