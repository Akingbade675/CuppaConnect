import 'package:flutter/material.dart';

class AppColors {
  static const black = Color(0xFF0C0F14);
  static const transparent = Colors.transparent;
  static const dark = 0xFF1C1C1C;
  static const white = Color(0xFFFFFFFF);
  static const brownn = Color(0xFFC67C4E);
  static const brown = Color(0xFFD17842);
  static const lightBrown = Color(0xFFFFF5EE);
  static const grey100 = Color(0xFF252A32);
  static const grey50 = Color(0xFF52555A);
  static const grey20 = Color(0xFFAEAEAE);
  static const bgGrey = Color(0xFF141921);
  static const gradientGrey = Color(0xFF262B33);

  // -- Gradients
  static final Gradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: const [0.0, 1.0],
    colors: [
      AppColors.gradientGrey,
      AppColors.gradientGrey.withOpacity(0.0),
    ],
  );
}
