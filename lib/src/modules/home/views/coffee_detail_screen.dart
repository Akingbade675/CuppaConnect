import 'package:cart_repository/cart_repository.dart' as CartSize;
import 'package:coffee_repository/coffee_repository.dart';
import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/components/coffee_description.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/cart/blocs/bloc/cart_item_bloc.dart';
import 'package:coffee_shop_app/src/modules/home/blocs/cubit/coffee_size_cubit.dart';
import 'package:coffee_shop_app/src/modules/home/components/details_image.dart';
import 'package:coffee_shop_app/src/modules/home/components/price_and_add_to_cart.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeDetailScreen extends StatelessWidget {
  final CoffeeItem data;

  const CoffeeDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeSizeCubit()..selectSize(data.sizes.first),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AAppBar(
          leadingIcon: AppIcons.back,
          trailingIcon: AppIcons.favourite,
          iconBg: AppColors.iconGradient2,
          onLeadingPressed: () => context.pop(),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoffeeDetailsImageWidget(
                      image: data.portraitImage,
                      name: data.name,
                      type: data.type,
                      isBean: data.isBean,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...buildCoffeeDescription(
                            context,
                            text: data.description,
                          ),
                          ..._buildCoffeeSize(
                            context,
                            sizes: data.sizes,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<CoffeeSizeCubit, CartSize.Size?>(
              builder: (context, sizeState) {
                return PageBottomPrice(
                  text: 'Price',
                  btnText: 'Add to Cart',
                  price: sizeState?.price ?? 0.0,
                  onBtnPressed: () => context
                      .read<CartItemBloc>()
                      .add(CartItemAdd(data, sizeState!)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCoffeeSize(BuildContext context,
      {required List<CartSize.Size> sizes}) {
    return [
      SizedBox(height: 28.h),
      Text(
        'Size',
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: 14.sp,
          color: AppColors.grey20,
        ),
      ),
      SizedBox(height: 12.h),
      BlocBuilder<CoffeeSizeCubit, CartSize.Size?>(
        builder: (context, sizeState) {
          return Row(
            children: List.generate(
              sizes.length,
              (index) {
                final isSelected = sizeState == sizes[index];
                final deviceWidth = MediaQuery.of(context).size.width;
                final chipWidth = (deviceWidth - 60.w - 26.w * 2) / 3;
                return Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: index < sizes.length - 1 ? 26 : 0),
                    child: RoundedContainer(
                      size: Size(chipWidth, 40),
                      border: isSelected
                          ? Border.all(
                              color: AppColors.brown,
                              width: 2,
                            )
                          : null,
                      child: FittedBox(
                        child: Text(
                          sizes[index].name,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color:
                                isSelected ? AppColors.brown : AppColors.grey20,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      onTap: () {
                        context
                            .read<CoffeeSizeCubit>()
                            .selectSize(sizes[index]);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    ];
  }
}
