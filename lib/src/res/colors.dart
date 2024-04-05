import 'package:flutter/material.dart';

class AppColors {
  static const black = Color(0xFF0C0F14);
  static const transparent = Colors.transparent;
  static const dark = 0xFF1C1C1C;
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFDC3535);
  static const white18 = Color.fromRGBO(255, 255, 255, 0.18);
  static const brownn = Color(0xFFC67C4E);
  static const brown = Color(0xFFD17842);
  static const lightBrown = Color(0xFFFFF5EE);
  static const grey100 = Color(0xFF252A32);
  static const grey50 = Color(0xFF52555A);
  static const grey20 = Color(0xFFAEAEAE);
  static const bgGrey = Color(0xFF141921);
  static const containerGrey = Color(0xFF262B33);
  static const iconGrey = Color(0xFF21262E);

  // -- Gradients
  static final Gradient coffeeItemGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: const [0.0, 1.0],
    colors: [
      AppColors.grey100, // #252A32
      AppColors.containerGrey.withOpacity(0.0), // #262B33
    ],
  );

  static final Gradient cartItemGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: const [0.0, 1.0],
    colors: [
      AppColors.containerGrey, // #262B33
      AppColors.containerGrey.withOpacity(0.0),
    ],
  );

  static final Gradient iconGradient1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: const [0.0, 1.0],
    colors: [
      AppColors.iconGrey, // #21262E
      AppColors.iconGrey.withOpacity(0.0),
    ],
  );

  static const Gradient iconGradient2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: const [0.0, 1.0],
    colors: [
      AppColors.iconGrey, // #21262E
      AppColors.black, // #0C0F14
    ],
  );

  static const Gradient paymentCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // stops: const [0.0, 1.0],
    colors: [
      AppColors.containerGrey, // #262B33
      AppColors.black, // #0C0F14
    ],
  );
}
