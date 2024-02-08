import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;

  const AppText(
    this.text, {
    Key? key,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  const AppText.small(
    this.text, {
    Key? key,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  const AppText.large(
    this.text, {
    Key? key,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  const AppText.bold(
    this.text, {
    Key? key,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 16,
    this.color = AppColors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
