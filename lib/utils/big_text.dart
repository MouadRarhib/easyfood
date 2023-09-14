import 'package:easyfood/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/dimention.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText(
      {super.key,
      this.color = Colors.white,
      required this.text,
      this.size = 25,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? Dimenssion.font20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
