import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscountTag extends StatelessWidget {
  const DiscountTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEAEAEA)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.discount,
            width: 24.w,
          ),
          SizedBox(width: 12.w),
          Text(
            '1 Discount is applied',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.grey100,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(AppIcons.arrowRight, width: 16.w),
        ],
      ),
    );
  }
}
