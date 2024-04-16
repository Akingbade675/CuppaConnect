import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyCoffeeItems extends StatelessWidget {
  final String text;

  const EmptyCoffeeItems(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/empty.json',
              height: 200.h, fit: BoxFit.fill),
          SizedBox(height: 20.h),
          Text(
            text,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
