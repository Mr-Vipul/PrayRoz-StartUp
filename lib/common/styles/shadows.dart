import 'package:flutter/cupertino.dart';

import '../../utils/constants/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: TColors.black.withOpacity(0.1),
    blurRadius: 5.8,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.black.withOpacity(0.1),
    blurRadius: 5.8,
    spreadRadius: 7,
    offset: const Offset(2, 0),
  );

}