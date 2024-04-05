import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/components/coffee_description.dart';
import 'package:coffee_shop_app/src/modules/home/components/details_image.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:coffee_shop_app/src/res/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(
        title: 'Favorites',
        leadingIcon: AppIcons.menu,
        trailingImage: AppImages.avatar,
        iconBg: AppColors.iconGradient1,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
              top: 20.h,
              bottom: 8.h,
            ),
            child: Column(
              children: [
                CoffeeDetailsImageWidget(
                  height: 457,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      25.w,
                    ),
                  ),
                  showFavouriteIcon: true,
                  image:
                      'assets/coffee_assets/americano/portrait/americano_pic_3_portrait.png',
                  name: 'Cappuccino',
                  type: 'With Steamed Milk',
                ),
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        25.w,
                      ),
                    ),
                    gradient: AppColors.cartItemGradient,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: buildCoffeeDescription(
                      context,
                      text:
                          'Cappuccino with Foam is a variation of the classic cappuccino, where the milk foam layer is thicker, giving it a creamier texture and a stronger foam flavor.',
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
