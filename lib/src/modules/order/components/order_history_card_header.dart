import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryCardHeader extends StatelessWidget {
  const OrderHistoryCardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Date',
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 14.sp,
              ),
            ),
            Text(
              '20th March 2021',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Total Amount',
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 14.sp,
              ),
            ),
            Text(
              '\$ 74.40',
              style: TextStyle(
                color: AppColors.brown,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
