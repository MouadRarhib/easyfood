import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimenssion {
  //height
  static double height20(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.7;
  static double height25(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.04375;
  static double height12(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.02625;
  static double height30(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.05;

  //width
  static double width20(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.7;
  static double width25(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04375;
  static double width12(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.02625;
  static double width30(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.05;

  // font size
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;
}
