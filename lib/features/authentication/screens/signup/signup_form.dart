import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prayroz/features/authentication/controllers/signup/signup_controller.dart';
import 'package:prayroz/features/authentication/screens/signup/terms_conditions_checkbox.dart';
import 'package:prayroz/utils/constants/sizes.dart';
import 'package:prayroz/utils/constants/text_strings.dart';
import 'package:prayroz/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
    // required this.dark,
  });

  // final bool dark;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText('Last Name', value),
                  decoration: const InputDecoration(
                    labelText: TTexts.LastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
    
          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) => TValidator.validateEmptyText('User', value),
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields,),
    
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(

              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),
    
          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),


          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed:() => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value?Iconsax.eye_slash: Iconsax.eye),
              ),
            ),
          ),
          ),


          const SizedBox(height: TSizes.spaceBtwSections,),
    
          // Terms and Conditions
          const TTermsAndConditionCheckBox(dark: false),
          const SizedBox(height: TSizes.spaceBtwSections),

          SizedBox(width: double.infinity, child: ElevatedButton(onPressed:()=> controller.signup(), child:  const Text(TTexts.createAccount),),),

        ],
        
      ),
    );
  }
}
