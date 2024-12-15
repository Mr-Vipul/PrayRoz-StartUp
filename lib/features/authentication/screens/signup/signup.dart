import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayroz/common/widgets/login_signup/form_divider.dart';
import 'package:prayroz/common/widgets/login_signup/social_buttons.dart';
import 'package:prayroz/features/authentication/screens/signup/signup_form.dart';
import 'package:prayroz/utils/constants/sizes.dart';
import 'package:prayroz/utils/constants/text_strings.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Form
              const TSignupForm(),

              const SizedBox(height: TSizes.spaceBtwSections),
              
              // Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!, dark: dark,),
              const SizedBox(height: TSizes.spaceBtwSections),


              // Footer
              const TSocialButtons(),
              // const SizedBox(height: TSizes.spaceBtwSections),



              
            ],
          ),
        ),
      ),
    );
  }
}

