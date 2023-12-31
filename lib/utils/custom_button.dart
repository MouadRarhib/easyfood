import 'package:easyfood/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading; // Add this line

  const CustomButton({
    required this.text,
    required this.onTap,
    required this.isLoading, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.textColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
