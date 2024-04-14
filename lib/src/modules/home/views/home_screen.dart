import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/home/components/coffee_beans_section.dart';
import 'package:coffee_shop_app/src/modules/home/components/coffee_types_section.dart';
import 'package:coffee_shop_app/src/modules/home/components/search_field.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:coffee_shop_app/src/res/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(
        leadingIcon: AppIcons.menu,
        trailingImage: AppImages.avatar,
        iconBg: AppColors.iconGradient1,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Text(
                    'Find the best',
                    style: context.textTheme.headlineLarge,
                  ),
                  Text(
                    'coffee for you',
                    style: context.textTheme.headlineLarge,
                  ),
                  SizedBox(height: 28.h),
                  const SearchField(),
                  SizedBox(height: 28.h),
                ],
              ),
            ),
            CoffeeTypesSection(),
            const CoffeeBeansSection(),
          ],
        ),
      ),
    );
  }
}
