import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Make sure to add this package to your pubspec.yaml

// Custom Widget for displaying Lottie animation with optional action button
class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display Lottie animation
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),

          const SizedBox(height: 20), // Adjust spacing as needed

          // Display the text below the animation
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20), // Adjust spacing as needed

          // If showAction is true, display the action button
          showAction
              ? SizedBox(
            width: 258,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text(
                actionText!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white),
              ),
            ),
          )
              : const SizedBox(), // Empty SizedBox if no action button is shown
        ],
      ),
    );
  }
}
