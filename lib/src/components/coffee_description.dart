import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

List<Widget> buildCoffeeDescription(
  BuildContext context, {
  required String text,
}) {
  return [
    Text(
      'Description',
      style: context.textTheme.bodyLarge?.copyWith(
        fontSize: 14.sp,
        color: AppColors.grey20,
      ),
    ),
    SizedBox(height: 10.h),
    ReadMoreText(
      text,
      trimLines: 2,
      colorClickableText: AppColors.brown,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read More',
      trimExpandedText: ' Show Less',
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      moreStyle: context.textTheme.bodyMedium?.copyWith(
        fontSize: 12.sp,
        color: AppColors.brown,
      ),
      preDataTextStyle: context.textTheme.bodySmall?.copyWith(
        color: AppColors.grey20,
      ),
      postDataTextStyle: context.textTheme.bodySmall?.copyWith(
        color: AppColors.grey20,
      ),
      lessStyle: context.textTheme.bodyMedium?.copyWith(
        fontSize: 12.sp,
        color: AppColors.brown,
      ),
    ),
  ];
}
