import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width=400,
    this.height=400,
    this.radius=400,
    this.padding=0,
    this.margin ,
    this.child,
    this.backgroundColor = TColors.textWhite,
  });

  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding as double),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius as double),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}