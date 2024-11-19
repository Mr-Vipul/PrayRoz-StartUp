import 'package:flutter/material.dart';
import 'package:prayroz/utils/constants/colors.dart';
import 'package:prayroz/utils/constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    labelStyle: const TextStyle(
      fontSize: TSizes.fontSizeMd,
      color: TColors.black,
    ),
    hintStyle: const TextStyle(
      fontSize: TSizes.fontSizeSm,
      color: TColors.black,
    ),
    errorStyle: const TextStyle(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: TextStyle(
      color: TColors.black.withOpacity(0.8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.grey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.dark,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.warning,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 2,
        color: TColors.warning,
      ),
    ),
  );
}
