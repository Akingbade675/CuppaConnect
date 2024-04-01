import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/cart/components/multiple_variation_cart_qty_picker.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleVariationCartItem extends StatelessWidget {
  const MultipleVariationCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: 12,
      borderRadius: 23,
      gradient: AppColors.cartItemGradient,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.w),
                child: Image.asset(
                  'assets/coffee_assets/latte/square/latte_pic_1_square.png',
                  fit: BoxFit.cover,
                  width: 100.w,
                  height: 100.h,
                ),
              ),
              SizedBox(width: 22.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CoffeeTitleText(text: 'Cappuccino', size: 16),
                    SizedBox(height: 4.h),
                    const CoffeeSideText(
                      text: 'With Steamed Milk',
                      color: AppColors.grey20,
                    ),
                    SizedBox(height: 12.h),
                    RoundedContainer(
                      size: const Size(118, 40),
                      child: Text(
                        'Medium Roasted',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.grey20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const MultiVariationCartQuantityPicker(
            text: 'S',
            price: 4.20,
            quantity: 1,
          ),
          SizedBox(height: 8.h),
          const MultiVariationCartQuantityPicker(
            text: 'M',
            price: 4.20,
            quantity: 1,
          ),
          SizedBox(height: 8.h),
          const MultiVariationCartQuantityPicker(
            text: 'L',
            price: 4.20,
            quantity: 1,
          ),
        ],
      ),
    );
  }
}
