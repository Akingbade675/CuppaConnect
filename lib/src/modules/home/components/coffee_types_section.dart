import 'package:coffee_repository/coffee_repository.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/home/components/coffee_item_card.dart';
import 'package:coffee_shop_app/src/modules/home/components/tab_indicator.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeTypesSection extends StatelessWidget {
  CoffeeTypesSection({super.key});

  final coffeeTypes = CoffeeData.coffeeTypes;
  final coffeeItems = CoffeeData.getCoffeeItems();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: coffeeTypes.length,
      child: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerHeight: 0,
              padding: EdgeInsets.only(right: 18.w),
              labelPadding: EdgeInsets.only(right: 20.w),
              splashFactory: NoSplash.splashFactory,
              indicator: CircleTabIndicator(
                radius: 4.w,
                color: AppColors.brown,
              ),
              unselectedLabelColor: AppColors.grey50,
              labelColor: AppColors.brown,
              labelStyle: context.textTheme.labelSmall,
              tabs: List.generate(coffeeTypes.length, (index) {
                return Tab(
                  text: coffeeTypes[index],
                );
              }),
            ),
            SizedBox(height: 22.h),
            SizedBox(
              height: 246.h,
              child: TabBarView(
                children: List.generate(
                  coffeeTypes.length,
                  (tabIndex) {
                    final coffees = coffeeItems[coffeeTypes[tabIndex]]!;
                    return ListView.separated(
                      padding: EdgeInsets.only(right: 22.w),
                      shrinkWrap: true,
                      itemCount: coffees.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (ctx, idx) => SizedBox(width: 22.w),
                      itemBuilder: (ctx, itemIndex) {
                        return CoffeeItemCard(data: coffees[itemIndex]);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
