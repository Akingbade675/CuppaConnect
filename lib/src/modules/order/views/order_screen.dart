import 'package:coffee_shop_app/src/components/app_text.dart';
import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/delivery/views/delivery_screen.dart';
import 'package:coffee_shop_app/src/modules/order/components/coffee_qty_chooser_widget.dart';
import 'package:coffee_shop_app/src/modules/order/components/custom_tab_bar.dart';
import 'package:coffee_shop_app/src/modules/order/components/delivery_tab_view.dart';
import 'package:coffee_shop_app/src/modules/order/components/discount_tag_widget.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(AppIcons.arrowLeft),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                CustomTabBar(tabController: tabController),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      DeliveryTabView(),
                      Center(child: Text('Pickup')),
                    ],
                  ),
                ),
                SizedBox(height: 140.h),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.money, width: 24.w),
                      SizedBox(width: 12.w),
                      Container(
                        width: 112.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.brown,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Cash',
                                  softWrap: false,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: AppText(
                                '\$ 5.53',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(AppIcons.dots, width: 24.w),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => context.push(const DeliveryScreen()),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      backgroundColor: AppColors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: AppText(
                      'Order',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallOutlinedButton extends StatelessWidget {
  final String icon;

  const SmallOutlinedButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.w,
      height: 28.w,
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEAEAEA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SvgPicture.asset(icon),
    );
  }
}

class AppAddressChip extends StatelessWidget {
  final String text;
  final String icon;

  const AppAddressChip({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDEDEDE)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            width: 14.w,
          ),
          SizedBox(width: 4.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF303336),
            ),
          ),
        ],
      ),
    );
  }
}
