import 'package:coffee_shop_app/src/components/svg_icon.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 241.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(
        top: 10.h,
        bottom: 15.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.w),
        border: Border.all(
          width: 2,
          color: AppColors.brown,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credit Card',
            style: context.textTheme.bodyLarge?.copyWith(
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w).copyWith(
                top: 15.h,
                bottom: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.w),
                gradient: AppColors.paymentCardGradient,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgIcon(
                        AppIcons.card,
                        color: AppColors.brown,
                        width: 31,
                        height: 24,
                      ),
                      SvgIcon(
                        AppIcons.visa,
                        color: AppColors.white,
                        width: 50,
                        height: 17,
                      ),
                    ],
                  ),
                  Flexible(child: SizedBox(height: 34.h)),
                  Text(
                    '3897 8923 6745 4638',
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 14.sp,
                      letterSpacing: 6.w,
                    ),
                  ),
                  // Flexible(child: SizedBox(height: 37.h)),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Card Holder Name',
                            style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 10.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'John Doe',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Expiry Date',
                            style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 10.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            '12 / 24',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
