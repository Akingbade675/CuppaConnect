import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/modules/cart/components/single_variation_cart_qty_picker.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleVariationCartItem extends StatelessWidget {
  const SingleVariationCartItem({super.key});

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
                  'assets/coffee_assets/americano/square/americano_pic_2_square.png',
                  fit: BoxFit.cover,
                  width: 126.w,
                  height: 126.h,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CoffeeTitleText(
                        text: 'Robusta Coffee Beans', size: 16),
                    SizedBox(height: 4.h),
                    const CoffeeSideText(
                      text: 'From Africa',
                      color: AppColors.grey20,
                    ),
                    SizedBox(height: 8.h),
                    const SingleVariationCartQuantityPicker(
                      text: '250gm',
                      price: 7.90,
                      quantity: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
