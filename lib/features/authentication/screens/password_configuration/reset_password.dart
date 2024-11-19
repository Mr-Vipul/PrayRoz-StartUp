import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayroz/utils/constants/image_strings.dart';
import 'package:prayroz/utils/constants/sizes.dart';
import 'package:prayroz/utils/constants/text_strings.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear),)
        ],
      ),

      body:  SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
                Image(image: const AssetImage(TImages.email), width:THelperFunctions.screenWidth()*0.6),
                const SizedBox(height: TSizes.spaceBtwItems,),

                // Title ans subtitle
                Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                const SizedBox(height: TSizes.spaceBtwItems,),
                Text(TTexts.changeYourPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium,  textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwSections,),


                // Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: const Text(TTexts.done),),
                ),

                const SizedBox(height: TSizes.spaceBtwItems,),


                 SizedBox(
                  width: double.infinity,
                  child: TextButton(onPressed: () {}, child: const Text(TTexts.resendEmail),),
                ),


          ],
        ),),
      ),

    );
  }
}