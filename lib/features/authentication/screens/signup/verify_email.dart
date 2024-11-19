import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayroz/common/widgets/success_screen/success_screen.dart';
import 'package:prayroz/features/authentication/screens/login/login.dart';
import 'package:prayroz/utils/constants/image_strings.dart';
import 'package:prayroz/utils/constants/sizes.dart';
import 'package:prayroz/utils/constants/text_strings.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(()=> const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: 
        Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: const AssetImage(TImages.email),
              width: THelperFunctions.screenWidth()*0.6
              ),
            const SizedBox(height: TSizes.spaceBtwItems,),


            // const Text("Welcome TO Email Verification"),


            // Title ans subtitle
            Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text('support@prayroz.com', style: Theme.of(context).textTheme.labelLarge,  textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.confirmencitSubTitle, style: Theme.of(context).textTheme.labelSmall, textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            

            // Buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(() => SuccessScreen(image: TImages.email, title: TTexts.yourAccountCreatedTitles, subtitle: TTexts.yourAccountCreatedSubTitle, onPressesed: () => Get.to(()=> const LoginScreen()),)), child: const Text(TTexts.tContinue),),),
            const SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(TTexts.resendEmail),),),


          ],
        ),
        ),

        
      ),
      
      
      
      );
  }
}
