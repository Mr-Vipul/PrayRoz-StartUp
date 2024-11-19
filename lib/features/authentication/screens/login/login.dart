import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayroz/common/styles/spacing_styles.dart';
import 'package:prayroz/common/widgets/login_signup/form_divider.dart';
import 'package:prayroz/features/authentication/screens/login/widgets/login_form.dart';
import 'package:prayroz/features/authentication/screens/login/widgets/login_header.dart';
import 'package:prayroz/common/widgets/login_signup/social_buttons.dart';
import 'package:prayroz/utils/constants/text_strings.dart';
import 'package:prayroz/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const TLoginHeader(),

              // Form
              const TLoginForm(),


              // Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!, dark: dark,)
              ,
              const SizedBox(height: 10,),

              // Footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
