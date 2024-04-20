import 'package:cart_repository/cart_repository.dart';
import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/components/custom_hero_widget.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/modules/cart/components/single_variation_cart_qty_picker.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleVariationCartItem extends StatelessWidget {
  final CartItem item;

  const SingleVariationCartItem({super.key, required this.item});

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
                child: HeroWidget(
                  tag: 'coffeeImage_${item.coffeeId}',
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                    width: 126.w,
                    height: 126.h,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeroWidget(
                      tag: 'coffeeTitleText_${item.coffeeId}',
                      child: CoffeeTitleText(text: item.name, size: 16),
                    ),
                    SizedBox(height: 4.h),
                    HeroWidget(
                      tag: 'coffeeSideText_${item.coffeeId}',
                      child: CoffeeSideText(
                        text: item.type,
                        color: AppColors.grey20,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SingleVariationCartQuantityPicker(item),
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
