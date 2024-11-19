import 'package:flutter/material.dart';
import 'package:prayroz/utils/constants/sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double mainAxisExtent; // Define 'mainAxisExtent' as a field in the class

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: TSizes.gridViewSpacing, // Vertical spacing
        crossAxisSpacing: TSizes.gridViewSpacing, // Horizontal spacing
        mainAxisExtent: mainAxisExtent, // Use the field here
      ),
      itemBuilder: itemBuilder,
    );
  }
}
