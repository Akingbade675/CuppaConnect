import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: double.maxFinite,
      padding: EdgeInsets.all(4.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TabBar(
        controller: tabController,
        indicatorColor: AppColors.brown,
        indicator: BoxDecoration(
          color: AppColors.brown,
          borderRadius: BorderRadius.circular(10),
        ),
        labelColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: AppColors.grey,
        unselectedLabelStyle: TextStyle(
          color: const Color(0xFF2D2F2C),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        tabs: const [
          Tab(
            text: 'Delivery',
          ),
          Text(
            'Pick Up',
          ),
        ],
      ),
    );
  }
}
