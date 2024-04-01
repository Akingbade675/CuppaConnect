import 'package:coffee_shop_app/src/components/app_icon_button.dart';
import 'package:coffee_shop_app/src/components/price_widget.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleVariationCartQuantityPicker extends StatelessWidget {
  final String text;
  final double price;
  final int quantity;

  const SingleVariationCartQuantityPicker({
    super.key,
    required this.text,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedContainer(
              size: const Size(75, 35),
              color: AppColors.black,
              child: FittedBox(
                child: Text(
                  text,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            PriceWidget(price: price, fontSize: 18),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppIconButton(iconPath: AppIcons.minus, size: 28),
            RoundedContainer(
              padding: 0,
              borderRadius: 7,
              color: AppColors.black,
              size: const Size(50, 30),
              border: Border.all(color: AppColors.brown),
              child: FittedBox(
                child: Text(
                  quantity.toString(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            const AppIconButton(
              iconPath: AppIcons.plus,
              size: 28,
            ),
          ],
        ),
      ],
    );
  }
}
