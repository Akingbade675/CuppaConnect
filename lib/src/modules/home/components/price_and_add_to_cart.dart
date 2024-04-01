import 'package:coffee_shop_app/src/components/price_widget.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/order/views/order_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageBottomPrice extends StatelessWidget {
  final String text;
  final String btnText;
  final double price;
  final VoidCallback? onBtnPressed;

  const PageBottomPrice({
    super.key,
    required this.price,
    required this.text,
    required this.btnText,
    this.onBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.grey20,
                ),
              ),
              SizedBox(height: 8.h),
              PriceWidget(price: price, fontSize: 20),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const OrderScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brown,
              elevation: 0,
              minimumSize: Size(240.w, 60.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Text(
              btnText,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
