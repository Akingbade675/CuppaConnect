import 'package:coffee_shop_app/src/constants/coffee_beans_data.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/home/components/coffee_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeBeansSection extends StatelessWidget {
  const CoffeeBeansSection({super.key});

  List<CoffeeBean> get coffeeBeans => CoffeeBean.getCoffeeBeans();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, top: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Coffee Beans',
            style: context.textTheme.headlineSmall,
          ),
          SizedBox(height: 18.h),
          SizedBox(
            height: 246.h,
            child: ListView.separated(
              padding: EdgeInsets.only(right: 22.w),
              shrinkWrap: true,
              itemCount: coffeeBeans.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 22.w),
              itemBuilder: (context, coffeeBeanIndex) {
                return CoffeeItemCard(
                  isBean: true,
                  data: coffeeBeans[coffeeBeanIndex],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
