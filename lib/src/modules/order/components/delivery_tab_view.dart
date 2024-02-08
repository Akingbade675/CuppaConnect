import 'package:coffee_shop_app/src/modules/order/components/coffee_qty_chooser_widget.dart';
import 'package:coffee_shop_app/src/modules/order/components/discount_tag_widget.dart';
import 'package:coffee_shop_app/src/modules/order/views/order_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryTabView extends StatelessWidget {
  const DeliveryTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Text(
            'Delivery Address',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Jl. Kpg Sutoyo',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.lightGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              const AppAddressChip(
                text: 'Edit Address',
                icon: AppIcons.edit,
              ),
              SizedBox(width: 8.w),
              const AppAddressChip(
                text: 'Add Note',
                icon: AppIcons.note,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          const Divider(
            color: Color(0xFFEAEAEA),
            height: 1,
          ),
          SizedBox(height: 20.h),
          const CoffeeQuantityChooser(),
          SizedBox(height: 20.h),
          const Divider(
            color: Color(0xFFF4F4F4),
            height: 4,
          ),
          SizedBox(height: 20.h),
          const DiscountTag(),
          SizedBox(height: 20.h),
          Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          const PaymentSummaryTextTag(
            text: 'Price',
            price: '\$ 4.53',
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                'Delivery Fee',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                '\$ 2.0',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '\$ 4.53',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const Divider(
            color: Color(0xFFEAEAEA),
            height: 2,
          ),
          SizedBox(height: 16.h),
          const PaymentSummaryTextTag(
            text: 'Total Payment',
            price: '\$ 5.53',
          ),
        ],
      ),
    );
  }
}

class PaymentSummaryTextTag extends StatelessWidget {
  final String text;
  final String price;

  const PaymentSummaryTextTag({
    super.key,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Text(
          price,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
