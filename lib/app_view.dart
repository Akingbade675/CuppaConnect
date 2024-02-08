import 'package:coffee_shop_app/src/modules/home/views/coffee_detail_screen.dart';
import 'package:coffee_shop_app/src/modules/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Sora',
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                // foregroundColor: const Color(0xFF2F2D2C),
                centerTitle: true,
                elevation: 0,
                titleTextStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2F2D2C),
                ),
                actionsIconTheme: const IconThemeData(
                  color: Color(0xFF2F2D2C),
                ),
              ),
            ),
            home: const HomeScreen(),
          );
        });
  }
}
