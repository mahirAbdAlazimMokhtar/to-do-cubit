import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_strings.dart';
class NoTaskWidget extends StatelessWidget {
  const NoTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(height: 50.0),
        Image.asset(AppAssets.noTasks),
        const SizedBox(height: 24.0),
        Text(
          AppString.noTaskTitle,
          style:
          Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 24),
        ),
        const SizedBox(height: 12.0),
        Text(
          AppString.noTaskTSubTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
