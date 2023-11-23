import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent(
      {super.key,
      required this.title,
      required this.hintTitle,
       this.controller,
      this.icon,this.readOnly = false});

  final String title;
  final String hintTitle;
  final TextEditingController? controller;
  final Widget? icon;
  final bool readOnly ;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(title, style: Theme.of(context).textTheme.displayMedium),
      const SizedBox(height: 16),
      TextFormField(
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintTitle,
          suffixIcon: icon,
          suffixIconColor: AppColors.white,
        ),
      ),
    ]);
  }
}
