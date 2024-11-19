import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prayroz/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:prayroz/features/authentication/screens/signup/signup.dart';
import 'package:prayroz/navigation_menu.dart';
import 'package:prayroz/utils/constants/sizes.dart';
import 'package:prayroz/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
    
          child: Column(
          children: [
            TextFormField( decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: TTexts.email,),
          ),
          
          const SizedBox(height: TSizes.spaceBtwInputFields,),
          
          TextFormField( decoration: const InputDecoration(prefixIcon: 
            Icon(Iconsax.password_check),
            labelText: TTexts.password,
            suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          
          const SizedBox(height: TSizes.spaceBtwInputFields/2,),
          
          // Remember me and forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Checkbox(value: true, onChanged: (value) {}),
                const Text(TTexts.rememberMe),
              ],),
          
              TextButton(onPressed: () => Get.to(()=> const ForgetPassword()), child: const Text(TTexts.forgetPassword),
              ),],),
          
            const SizedBox(height: TSizes.spaceBtwSections,),
          
          
            // Sign IN button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(TTexts.signIn)),),
            const SizedBox(height: TSizes.spaceBtwItems,),
          
            // Create Account Button
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: ()=> Get.to(() => const SignUpScreen()), child: const Text(TTexts.createAccount)),),
            // const SizedBox(height: TSizes.spaceBtwSections,)
            ],
            ),
        ),
      );
  }
}
