import 'package:coffee_shop_app/src/components/app_icon_button.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/home/components/coffee_item_card.dart';
import 'package:coffee_shop_app/src/modules/home/views/coffee_detail_screen.dart';
import 'package:coffee_shop_app/src/modules/order/views/order_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final coffees = const ['Cappuccino', 'Latte', 'Espresso', 'Mocha'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 350.h,
              child: Stack(
                children: [
                  Container(
                    height: 280.h,
                    padding: EdgeInsets.only(
                      top: context.statusBarHeight + 18.h,
                      left: 30.w,
                      right: 30.w,
                    ),
                    color: const Color(AppColors.black),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: TextStyle(
                                    color: const Color(0xFFB7B7B7),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  'Bilzen, Tanjungbalai',
                                  style: TextStyle(
                                    color: const Color(0xFFDDDDDD),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 38.w,
                              height: 38.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/person.png',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(AppColors.darkL),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 16.w),
                              SvgPicture.asset(
                                'assets/icons/search-normal.svg',
                                width: 20.w,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search coffee',
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF989898),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                      left: 10.w,
                                      right: 10.w,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(3.w),
                                child: AppIconButton(
                                  size: 40,
                                  padding: 10,
                                  iconPath: 'assets/icons/setting-4.svg',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 140.h,
                      width: 315.w,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(87, 0, 0, 0),
                                  offset: Offset(2, 2),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/promo_bg.png',
                                width: 315.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12.h,
                            left: 24.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFED5151),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: Text(
                                    'Promo',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  color: const Color(AppColors.dark),
                                  child: Text(
                                    'Buy one get ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Container(
                                  color: const Color(AppColors.dark),
                                  child: Text(
                                    'one FREE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverPadding(
            padding: EdgeInsets.only(left: 30.w),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 36,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (conetxt, index) {
                    return Container(
                      height: 36,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: index == 0 ? AppColors.brown : Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        coffees[index],
                        style: TextStyle(
                          color: index == 0 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8.w),
                  itemCount: 4,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 239.h,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => context.push(const CoffeeDetailScreen()),
                child: CoffeeItemCard(index: index),
              ),
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
