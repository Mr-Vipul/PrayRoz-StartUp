import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:prayroz/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:prayroz/utils/constants/colors.dart';
import 'package:prayroz/utils/constants/image_strings.dart';
// import 'package:prayroz/utils/constants/sizes.dart';
// import 'package:prayroz/utils/device/device_utility.dart';
// import 'package:prayroz/utils/helpers/helper_functions.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(image: TImages.agni, title: 'Online & Offline Pooja', textColor: TColors.White, onTap: (){},);
        },
      ),
    );
  }
}

