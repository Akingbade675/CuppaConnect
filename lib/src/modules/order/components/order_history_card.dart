import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/components/price_widget.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: 18,
      borderRadius: 23,
      gradient: AppColors.cartItemGradient,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.w),
                child: Image.asset(
                  'assets/coffee_assets/latte/square/latte_pic_1_square.png',
                  fit: BoxFit.cover,
                  width: 57.w,
                  height: 57.h,
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
                    const CoffeeSideText(text: 'With Steamed Milk'),
                  ],
                ),
              ),
              // SizedBox(width: 8.w),
              // const Spacer(),
              const PriceWidget(price: 37.20, fontSize: 20),
            ],
          ),
          SizedBox(height: 12.h),
          const OrderHistoryPriceTile(),
          SizedBox(height: 10.h),
          const OrderHistoryPriceTile(),
          SizedBox(height: 10.h),
          const OrderHistoryPriceTile(),
        ],
      ),
    );
  }
}

class OrderHistoryPriceTile extends StatelessWidget {
  const OrderHistoryPriceTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedContainer(
            padding: 0,
            borderRadius: 10,
            color: AppColors.black,
            size: const Size(141, 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'S',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
                Container(
                  width: 1,
                  color: AppColors.iconGrey,
                ),
                const PriceWidget(price: 4.20, fontSize: 16),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'x ',
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 16.sp,
                color: AppColors.brown,
              ),
              children: [
                TextSpan(
                  text: '2',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '8.40',
            style: context.textTheme.bodyLarge?.copyWith(
              fontSize: 16.sp,
              color: AppColors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
