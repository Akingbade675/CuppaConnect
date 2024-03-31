import 'package:coffee_shop_app/src/components/app_text.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapBottomSheet extends StatelessWidget {
  const MapBottomSheet({
    super.key,
    required this.result,
  });

  final PolylineResult result;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 322.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFE4E4E4),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 5,
            width: 44.w,
            decoration: BoxDecoration(
              color: AppColors.grey20,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
          SizedBox(height: 16.h),
          AppText.bold(
            result.duration ?? '',
            color: const Color(0xFF303336),
          ),
          SizedBox(height: 6.h),
          Text.rich(
            TextSpan(
              text: 'Delivery to ',
              style: TextStyle(
                color: AppColors.grey20,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
              children: [
                TextSpan(
                  text: 'Magodo Ikeja, Ikosi Ketu',
                  style: TextStyle(
                    color: AppColors.grey100,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 5.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Container(
                  height: 4.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: index == 3
                        ? const Color(0xFFDFDFDF)
                        : const Color(0xFF36C07E),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Container(width: 10.w, color: Colors.white),
              itemCount: 4,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 90.h,
            width: 315.w,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: const Color(0xFFEAEAEA),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 62.w,
                  width: 62.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: const Color(0xFFDEDEDE),
                    ),
                  ),
                  child: Image.asset(
                    AppIcons.bike,
                    width: 32.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Delivered your order',
                      color: const Color(0xFF303336),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'We deliver your goods to you...',
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.grey100,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Container(
                height: 54.w,
                width: 54.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/person.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 7.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bold(
                    'John Doe',
                    color: const Color(0xFF303336),
                    fontSize: 14.sp,
                  ),
                  const SizedBox(height: 8),
                  AppText(
                    'Delivery Agent',
                    color: AppColors.grey100,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 54.w,
                width: 54.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: const Color(0xFFEAEAEA),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(AppIcons.telephone),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
