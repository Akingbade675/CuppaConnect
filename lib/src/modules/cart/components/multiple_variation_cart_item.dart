import 'package:cart_repository/cart_repository.dart' show CartItem;
import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/cart/components/multiple_variation_cart_qty_picker.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleVariationCartItem extends StatelessWidget {
  final CartItem item;

  const MultipleVariationCartItem({
    super.key,
    required this.item,
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
                  item.image,
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
                    CoffeeTitleText(text: item.name, size: 16),
                    SizedBox(height: 4.h),
                    CoffeeSideText(
                      text: item.type,
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
          ListView.separated(
            itemBuilder: (context, index) {
              final cartItemSizes = item.sizes;
              cartItemSizes.sort((a, b) {
                return a.name.codeUnitAt(0).compareTo(b.name.codeUnitAt(0));
              });
              return MultiVariationCartQuantityPicker(
                coffeeId: item.coffeeId,
                size: cartItemSizes[index],
              );
            },
            separatorBuilder: (_, __) => SizedBox(height: 8.h),
            itemCount: item.sizes.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
