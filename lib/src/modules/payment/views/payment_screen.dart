import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/home/components/price_and_add_to_cart.dart';
import 'package:coffee_shop_app/src/modules/payment/components/credit_card_widget.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:coffee_shop_app/src/res/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  final List<Map<String, dynamic>> paymentMethods = const [
    {
      'name': 'Wallet',
      'icon': AppImages.applepay,
      'amount': 10.40,
    },
    {
      'name': 'Google Pay',
      'icon': AppImages.gpay,
    },
    {
      'name': 'Apple Pay',
      'icon': AppImages.applepay,
    },
    {
      'name': 'Amazon Pay',
      'icon': AppImages.amazonpay,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(
        title: 'Payment',
        leadingIcon: AppIcons.back,
        iconBg: AppColors.iconGradient1,
        onLeadingPressed: () => context.pop(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  const CreditCardWidget(),
                  SizedBox(height: 13.h),
                  ...List.generate(
                    paymentMethods.length,
                    (index) {
                      final paymentMethod = paymentMethods[index];
                      return _buildPaymentMethodCard(
                        context,
                        name: paymentMethod['name'],
                        icon: paymentMethod['icon'],
                        amount: paymentMethod.containsKey('amount')
                            ? paymentMethod['amount']
                            : null,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const PageBottomPrice(
            price: 4.20,
            text: 'Price',
            btnText: 'Pay with Credit Card',
          ),
        ],
      ),
    );
  }

  Container _buildPaymentMethodCard(
    BuildContext context, {
    required String name,
    required String icon,
    double? amount,
    bool isSelected = false,
  }) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.w),
        border: Border.all(
          width: 2,
          color: isSelected ? AppColors.brown : AppColors.containerGrey,
        ),
        gradient: AppColors.paymentCardGradient,
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            // width: 25.w,
            // height: 20.h,
          ),
          SizedBox(width: 10.w),
          Text(
            name,
            style: context.textTheme.bodyLarge!.copyWith(
              fontSize: 14.sp,
            ),
          ),
          const Spacer(),
          if (amount != null)
            Text(
              '\$ $amount',
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 14.sp,
                color: AppColors.white,
              ),
            ),
        ],
      ),
    );
  }
}
