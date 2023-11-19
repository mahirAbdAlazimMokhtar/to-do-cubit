import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  Color? backgroundColor;

   CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.backgroundColor = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
        backgroundColor: MaterialStateProperty.all(backgroundColor)
      ),
      onPressed: onPressed,
      child: Text(title, style: Theme.of(context).textTheme.displayMedium),
    );
  }
}
