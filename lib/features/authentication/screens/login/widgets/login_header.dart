
import 'package:flutter/material.dart';
import 'package:prayroz/utils/constants/sizes.dart';
import 'package:prayroz/utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Image(
        //   height: 150,
        //   image: AssetImage(TImages.darkAppLogo),
        // ),
        const SizedBox(height: 20),
        const Text("Prayroz!", style: TextStyle(color: Color.fromARGB(255, 255, 140, 0), fontWeight: FontWeight.bold, fontSize: 50, ),),
        const SizedBox(height: 25),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
    
      ],
    );
  }
}
