import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomBarHeight => mediaQuery.padding.bottom;
  double get appBarHeight => kToolbarHeight;
  double get padding => 16.0;
  double get paddingSmall => 8.0;
  double get paddingLarge => 24.0;
  double get borderRadius => 8.0;
  double get borderRadiusSmall => 4.0;
  double get borderRadiusLarge => 12.0;
  double get iconSize => 24.0;
  double get iconSizeSmall => 20.0;
  double get iconSizeLarge => 28.0;
  double get fontSize => 16.0;
  double get fontSizeSmall => 14.0;
  double get fontSizeLarge => 18.0;
  double get elevation => 4.0;
  double get elevationSmall => 2.0;
  double get elevationLarge => 6.0;
  double get spacing => 8.0;
  double get spacingSmall => 4.0;
  double get spacingLarge => 12.0;
  double get spacingXLarge => 16.0;
  double get spacingXXLarge => 20.0;
  double get spacingXXXLarge => 24.0;
  double get spacingXXXXLarge => 28.0;
  double get spacingXXXXXLarge => 32.0;
  double get spacingXXXXXXLarge => 36.0;
  double get spacingXXXXXXXLarge => 40.0;
  double get spacingXXXXXXXXLarge => 44.0;
  double get spacingXXXXXXXXXLarge => 48.0;
  double get spacingXXXXXXXXXXLarge => 52.0;
  double get spacingXXXXXXXXXXXLarge => 56.0;
  double get spacingXXXXXXXXXXXXLarge => 60.0;
  double get spacingXXXXXXXXXXXXXLarge => 64.0;
  double get spacingXXXXXXXXXXXXXXLarge => 68.0;

  void pop() => Navigator.of(this).pop();
  void popUntil(String routeName) =>
      Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  void pushNamed(String routeName) => Navigator.of(this).pushNamed(routeName);
  void pushReplacementNamed(String routeName) =>
      Navigator.of(this).pushReplacementNamed(routeName);
  void pushNamedAndRemoveUntil(String routeName) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  void push(Widget widget) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget));
}
