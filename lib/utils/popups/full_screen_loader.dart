import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog.
class TFullScreenLoader {
  /// Opens a full-screen loading dialog with the given text and animation.
  ///
  /// Parameters:
  /// [text]: The text to be displayed in the loading dialog.
  /// [animation]: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // Use Get.overlayContext for overlay dialogs.
      barrierDismissible: false, // Prevents dismissal by tapping outside.
      builder: (_) => PopScope(
        canPop: false,
        // Disable back button functionality.
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 250),
              // Add your animation loader widget.
              TAnimationLoaderWidget(text: text, animation: animation,),
            ],
          ),
        ),
      ),
    );
  }

  /// Closes the full-screen loading dialog.
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
