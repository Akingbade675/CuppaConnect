import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/modules/order/components/order_history_card.dart';
import 'package:coffee_shop_app/src/modules/order/components/order_history_card_header.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:coffee_shop_app/src/res/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(
        title: 'Order History',
        leadingIcon: AppIcons.menu,
        trailingImage: AppImages.avatar,
        iconBg: AppColors.iconGradient1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              // shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                    top: 20.h,
                    bottom: 8.h,
                  ),
                  child: Column(
                    children: [
                      const OrderHistoryCardHeader(),
                      SizedBox(height: 8.h),
                      ListView.separated(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (ctx, ind) => SizedBox(height: 14.h),
                        itemBuilder: (ctx, ind) => const OrderHistoryCard(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const FullWidthButton(),
        ],
      ),
    );
  }
}

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
        bottom: 10.h,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.w),
          ),
        ),
        child: Text(
          'Download',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
