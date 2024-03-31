import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeTitleText extends StatelessWidget {
  final String text;
  final double size;

  const CoffeeTitleText({
    super.key,
    this.size = 13,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: AppColors.white,
        fontSize: size.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class CoffeeSideText extends StatelessWidget {
  final String text;
  final double size;

  const CoffeeSideText({
    super.key,
    required this.text,
    this.size = 9,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.white,
        fontSize: size.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
