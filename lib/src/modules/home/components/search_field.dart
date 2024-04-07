import 'package:coffee_shop_app/src/components/svg_icon.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.bgGrey,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgIcon(
            AppIcons.search,
            color: AppColors.grey50,
            size: 16.w,
          ),
          SizedBox(width: 18.w),
          Expanded(
            child: Text(
              'Find Your Coffee...',
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
