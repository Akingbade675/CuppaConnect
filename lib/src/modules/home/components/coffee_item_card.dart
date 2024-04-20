import 'package:coffee_repository/coffee_repository.dart';
import 'package:coffee_shop_app/src/components/app_icon_button.dart';
import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/components/custom_hero_widget.dart';
import 'package:coffee_shop_app/src/components/custom_page_router.dart';
import 'package:coffee_shop_app/src/components/price_widget.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/cart/blocs/bloc/cart_item_bloc.dart';
import 'package:coffee_shop_app/src/modules/home/views/coffee_detail_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeItemCard extends StatelessWidget {
  final CoffeeItem data;

  const CoffeeItemCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22.r),
      onTap: () {
        context.pushTransition(
          CustomPageRouter(
            route: (_, animation, __) => CoffeeDetailScreen(
              data: data,
              animation: animation,
            ),
          ),
        );
      },
      child: Container(
        // height: 239.h,
        width: 150.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          gradient: AppColors.coffeeItemGradient,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Column(
          children: [
            CoffeeImageWidget(
              id: data.id,
              imageString: data.squareImage,
              isBean: data.isBean,
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeroWidget(
                    tag: 'coffeeTitleText_${data.id}',
                    child: CoffeeTitleText(text: data.name),
                  ),
                  SizedBox(height: 5.h),
                  HeroWidget(
                    tag: 'coffeeSideText_${data.id}',
                    child: CoffeeSideText(
                      text: data.type,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      HeroWidget(
                        tag: 'coffeePrice_${data.id}',
                        child: PriceWidget(
                          price: data.sizes.first.price,
                          fontSize: 15,
                        ),
                      ),
                      const Spacer(),
                      HeroWidget(
                        tag: 'coffeeAddToCart_${data.id}',
                        child: AppIconButton(
                          size: 28,
                          iconPath: AppIcons.plus,
                          onPressed: () => context.read<CartItemBloc>().add(
                                CartItemAdd(data, data.sizes.first),
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeImageWidget extends StatelessWidget {
  final String id;
  final bool isBean;
  final String imageString;

  const CoffeeImageWidget({
    super.key,
    required this.imageString,
    required this.isBean,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'coffeeImage_$id',
          child: Container(
            height: 126.h,
            decoration: BoxDecoration(
              color: AppColors.grey50.withOpacity(0.16),
              borderRadius: BorderRadius.circular(22.r),
              image: DecorationImage(
                image: AssetImage(imageString),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        if (!isBean)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(22.r),
                  bottomLeft: Radius.circular(22.r),
                ),
              ),
              child: Row(
                children: [
                  HeroWidget(
                    tag: 'coffeeRatingBar_$id',
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 10.w,
                    ),
                  ),
                  const SizedBox(width: 2),
                  HeroWidget(
                    tag: 'coffeeRating_$id',
                    child: Text(
                      '4.5',
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 10.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
