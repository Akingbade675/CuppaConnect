import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceWidget extends StatelessWidget {
  final double price, fontSize;

  const PriceWidget({
    super.key,
    required this.price,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '\$ ',
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: fontSize.sp,
          color: AppColors.brown,
        ),
        children: [
          TextSpan(
            text: price.toStringAsFixed(2),
            style: context.textTheme.bodyLarge?.copyWith(
              fontSize: fontSize.sp,
            ),
          ),
        ],
      ),
    );
  }
}
