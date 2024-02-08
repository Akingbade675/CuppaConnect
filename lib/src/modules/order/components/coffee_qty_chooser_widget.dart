import 'package:coffee_shop_app/src/components/app_text.dart';
import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/modules/order/views/order_screen.dart';
import 'package:coffee_shop_app/src/res/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeQuantityChooser extends StatelessWidget {
  const CoffeeQuantityChooser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/coffee_1.png',
            width: 54.w,
            height: 54.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          children: [
            const CoffeeTitleText(size: 16),
            SizedBox(height: 4.h),
            const CoffeeSideText(),
          ],
        ),
        const Spacer(),
        const SmallOutlinedButton(icon: AppIcons.minus),
        SizedBox(width: 14.w),
        AppText.bold(
          '1',
          fontSize: 14.sp,
        ),
        SizedBox(width: 14.w),
        const SmallOutlinedButton(icon: AppIcons.plus),
      ],
    );
  }
}
