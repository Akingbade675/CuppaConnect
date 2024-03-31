import 'package:coffee_shop_app/src/modules/order/components/coffee_qty_chooser_widget.dart';
import 'package:coffee_shop_app/src/modules/order/components/discount_tag_widget.dart';
import 'package:coffee_shop_app/src/modules/order/views/order_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryTabView extends StatelessWidget {
  const DeliveryTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
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
            color: AppColors.grey100,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Text(
          price,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.grey100,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
