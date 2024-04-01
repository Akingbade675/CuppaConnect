import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedContainer extends StatelessWidget {
  final Size? size;
  final Border? border;
  final Gradient? gradient;
  final double padding;
  final double borderRadius;
  final Color color;
  final Widget child;

  const RoundedContainer({
    super.key,
    required this.child,
    this.size,
    this.border,
    this.gradient,
    this.borderRadius = 10,
    this.padding = 8,
    this.color = AppColors.bgGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size?.width.w,
      height: size?.height.h,
      padding: EdgeInsets.all(padding.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius.w),
        border: border,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
