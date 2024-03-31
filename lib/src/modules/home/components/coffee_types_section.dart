import 'package:coffee_shop_app/src/constants/coffees_data.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/home/components/coffee_item_card.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeTypesSection extends StatelessWidget {
  const CoffeeTypesSection({super.key});

  final coffeeTypes = CoffeeData.coffeeTypes;

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
                    final coffees = Coffee.getCoffees(coffeeTypes[tabIndex]);
                    return ListView.separated(
                      padding: EdgeInsets.only(right: 22.w),
                      shrinkWrap: true,
                      itemCount: coffees.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 22.w),
                      itemBuilder: (context, itemIndex) {
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

class CircleTabIndicator extends Decoration {
  final double radius;
  final Color color;

  const CircleTabIndicator({required this.radius, required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(this);
  }
}

class _CirclePainter extends BoxPainter {
  final CircleTabIndicator decoration;

  _CirclePainter(this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset +
        Offset(cfg.size!.width / 2, cfg.size!.height - decoration.radius);
    final Paint paint = Paint()
      ..color = decoration.color
      ..isAntiAlias = true;
    canvas.drawCircle(circleOffset, decoration.radius, paint);
  }
}
