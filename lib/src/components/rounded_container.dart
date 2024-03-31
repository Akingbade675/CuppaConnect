import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedContainer extends StatelessWidget {
  final Size size;
  final Border? border;
  final Widget child;

  const RoundedContainer({
    super.key,
    required this.child,
    required this.size,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size.width.w,
      height: size.height.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.bgGrey,
        borderRadius: BorderRadius.circular(10.w),
        border: border,
      ),
      child: child,
    );
  }
}
