import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prayroz/features/authentication/controllers/login/login_controller.dart';
import 'package:prayroz/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:prayroz/features/authentication/screens/signup/signup.dart';
import 'package:prayroz/navigation_menu.dart';
import 'package:prayroz/utils/constants/sizes.dart';
import 'package:prayroz/utils/constants/text_strings.dart';
import 'package:prayroz/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            ///Email
            TextFormField(
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields,),

            Obx(
              () => TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),

            /// Remember me and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value)),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // Sign IN button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Text(TTexts.signIn)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignUpScreen()),
                  child: const Text(TTexts.createAccount)),
            ),
            // const SizedBox(height: TSizes.spaceBtwSections,)
          ],
        ),
      ),
    );
  }
}
