import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividerText,
    required this.dark,
  });

  final String dividerText;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Divider(
            color: Colors.black26,
            thickness: 0.5,
            indent: 20,
            endIndent: 10,
          ),
        ),
        Text(
          dividerText.capitalize!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Flexible(
          child: Divider(
            color: Colors.black26,
            thickness: 0.5,
            indent: 10,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}
