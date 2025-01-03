import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:get/get_core/src/get_main.dart';
import 'package:prayroz/common/styles/spacing_styles.dart';
import 'package:prayroz/features/authentication/screens/login/login.dart';
import 'package:prayroz/utils/constants/sizes.dart';
import 'package:prayroz/utils/constants/text_strings.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressesed});

  final String image, title, subtitle ; 
  final VoidCallback onPressesed ; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight*2 ,
          child: Column(
            children: [
              Image(image: AssetImage(image), width:THelperFunctions.screenWidth()*0.6),
              //  const Text("Welcome TO Email Verification"),
               const SizedBox(height: TSizes.spaceBtwItems,),

                // Title ans subtitle
                Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                const SizedBox(height: TSizes.spaceBtwItems,),
                Text(subtitle, style: Theme.of(context).textTheme.labelMedium,  textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwSections,),

                // Buttons
                SizedBox(
                  width: double.infinity, 
                  child: ElevatedButton(onPressed: ()=> Get.to(() => const LoginScreen()),  child: const Text(TTexts.tContinue),),),
              
            ],
          ),),
          
      ),
    );
  }
}